#include <Adafruit_Sensor.h>
#include <DHT.h>

#include <HABinarySensor.h>
#include <HADeviceManager.h>
#include <HASensor.h>
#include <HALight.h>

#include "config.h"

#define MQTT_VERSION MQTT_VERSION_3_1_1

#define GARAGE_DOOR_SW_PIN 5
#define SIDE_DOOR_SW_PIN 4

#define NODE_NAME "garage"

DHT dht(14, DHT22);

HADeviceManager manager(MQTT_SERVER_IP, MQTT_CLIENT_ID, MQTT_USER,
                        MQTT_PASSWORD, 1883, NODE_NAME"/online");

HABinarySensor garage_door(NODE_NAME"/garage_door");
HABinarySensor side_door(NODE_NAME"/side_door");
HASensor humidity(NODE_NAME"/humid");
HASensor temperature(NODE_NAME"/temp");

void callback(char *topic, byte *payload, unsigned int len)
{
  manager.mqttCallback(topic, payload, len);
}

void update_dht_sensor()
{
  float h = dht.readHumidity();
  float t = dht.readTemperature();

  humidity.updateSensorFloat(h);
  temperature.updateSensorFloat(t);
}

bool garage_door_last = true;
bool side_door_last = true;

void update_door_sensors()
{
  bool garage_door_state = digitalRead(GARAGE_DOOR_SW_PIN);
  bool side_door_state = digitalRead(SIDE_DOOR_SW_PIN);

  if (garage_door_last == garage_door_state)
    garage_door.updateSensor(garage_door_state);
  if (side_door_last == side_door_state)
    side_door.updateSensor(side_door_state);

  garage_door_last = garage_door_state;
  side_door_last = side_door_state;
}

void setup()
{
  Serial.begin(9600);

  dht.begin();

  pinMode(GARAGE_DOOR_SW_PIN, INPUT_PULLUP);
  pinMode(SIDE_DOOR_SW_PIN, INPUT_PULLUP);

  manager.connectWiFi(WIFI_SSID, WIFI_PASSWORD);
  manager.mqtt().setCallback(callback);

  manager.addDevice(&humidity);
  manager.addDevice(&temperature);
  manager.addDevice(&garage_door);
  manager.addDevice(&side_door);
}

uint32_t last_dht_poll_time = 0;
uint32_t last_door_poll_time = 0;

void loop()
{
  manager.loop();

  uint32_t now = millis();

  if (now - last_dht_poll_time > 60000)
  {
    update_dht_sensor();
    last_dht_poll_time = now;
  }

  if (now - last_door_poll_time > 500)
  {
    update_door_sensors();
    last_door_poll_time = now;
  }
}
