#include "MQTT/MQTT.h"

#define LED_PIN 7
#define WHEEL_SENSOR_PIN 5

#define SESSION_TIMEOUT_MS 30000
#define WHEEL_SENSOR_DEBOUNCE_MS 10
#define SAMPLING_INTERVAL_MS 5000
#define PULSES_PER_REVOLUTION 1
#define WHEEL_DIAMETER_MM 1330

MQTT mqtt("BROKER", 1883, NULL);

unsigned long session_start_time;
unsigned long session_pulses;
unsigned long int last_sample_time;
unsigned long int no_pulse_timeout_start;
volatile unsigned long pulses;
volatile unsigned long last_pulse_time;

float distance_factor;
float speed_factor;

void wheel_sensor_isr();

void setup()
{
  pinMode(LED_PIN, OUTPUT);

  pinMode(WHEEL_SENSOR_PIN, INPUT_PULLUP);
  attachInterrupt(WHEEL_SENSOR_PIN, &wheel_sensor_isr, FALLING);

  session_start_time = 0;
  session_pulses = 0;
  last_sample_time = millis();
  no_pulse_timeout_start = 0;
  pulses = 0;
  last_pulse_time = 0;

  distance_factor = (3.14 * (float)WHEEL_DIAMETER_MM) / 1000.0;
  speed_factor = 3600.0 / SAMPLING_INTERVAL_MS;
}

void loop()
{
  if (mqtt.isConnected())
  {
    mqtt.loop();
  }
  else
  {
    digitalWrite(LED_PIN, HIGH);

    mqtt.connect("ID", "USER", "PASSWD");
    if (mqtt.isConnected())
    {
      digitalWrite(LED_PIN, LOW);

      mqtt.publish("/aya/status", "idle");

      char buf[20];

      byte mac[6];
      WiFi.macAddress(mac);
      sprintf(buf, "%02X:%02X:%02X:%02X:%02X:%02X", mac[0], mac[1], mac[2],
              mac[3], mac[4], mac[5]);
      mqtt.publish("/aya/mac", buf);

      IPAddress ip = WiFi.localIP();
      sprintf(buf, "%d.%d.%d.%d", ip[0], ip[1], ip[2], ip[3]);
      mqtt.publish("/aya/ip", buf);
    }
  }

  if (millis() - last_sample_time > SAMPLING_INTERVAL_MS)
  {
    // Record sampled pulses
    int sample_pulses = pulses;
    pulses = 0;
    last_sample_time = millis();

    if (session_start_time == 0)
    {
      // Check for start of session
      if (sample_pulses > 0)
      {
        session_start_time = millis();
        mqtt.publish("/aya/status", "active");
      }
    }
    else
    {
      // Check for end of session
      if (sample_pulses == 0)
      {
        if (no_pulse_timeout_start == 0)
        {
          no_pulse_timeout_start = millis();
          mqtt.publish("/aya/status", "session_timeout_started");
        }
        else if (millis() - no_pulse_timeout_start > SESSION_TIMEOUT_MS)
        {
          session_start_time = 0;
          no_pulse_timeout_start = 0;
          session_pulses = 0;
          mqtt.publish("/aya/status", "session_timeout");
          mqtt.publish("/aya/status", "idle");
          return;
        }
      }
      else if (no_pulse_timeout_start != 0)
      {
        no_pulse_timeout_start = 0;
        mqtt.publish("/aya/status", "active");
      }

      // Calculate new measurements
      session_pulses += sample_pulses;

      // Rotations
      int sample_rotations = sample_pulses / PULSES_PER_REVOLUTION;
      int session_rotations = session_pulses / PULSES_PER_REVOLUTION;

      // Time in seconds
      int session_time = (millis() - session_start_time) / 1000;

      // Distance in m
      float sample_distance = sample_rotations * distance_factor;
      float session_distance = session_rotations * distance_factor;

      // Speed in km/h
      float sample_speed = sample_distance * speed_factor;

      // Send MQTT updates
      char buf[10];

      // Pulses
      sprintf(buf, "%d", sample_pulses);
      mqtt.publish("/aya/sample/pulses", buf);
      sprintf(buf, "%d", session_pulses);
      mqtt.publish("/aya/session/pulses", buf);

      // Rotations
      sprintf(buf, "%d", sample_rotations);
      mqtt.publish("/aya/sample/rotations", buf);
      sprintf(buf, "%d", session_rotations);
      mqtt.publish("/aya/session/rotations", buf);

      // Time
      sprintf(buf, "%d", session_time);
      mqtt.publish("/aya/session/time", buf);

      // Distance
      sprintf(buf, "%.1f", sample_distance);
      mqtt.publish("/aya/sample/distance", buf);
      sprintf(buf, "%.1f", session_distance);
      mqtt.publish("/aya/session/distance", buf);

      // Speed
      sprintf(buf, "%.1f", sample_speed);
      mqtt.publish("/aya/sample/speed", buf);
    }
  }
}

void wheel_sensor_isr()
{
  if (millis() - last_pulse_time > WHEEL_SENSOR_DEBOUNCE_MS)
  {
    pulses++;
    last_pulse_time = millis();
  }
}
