#include <Adafruit_NeoPixel.h>
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <HADeviceManager.h>
#include <HALight.h>
#include <HASensor.h>

#include "config.h"

#define MQTT_VERSION MQTT_VERSION_3_1_1

Adafruit_NeoPixel leds(14, D1, NEO_GRB + NEO_KHZ800);
DHT dht(D4, DHT22);

HADeviceManager manager(MQTT_SERVER_IP, MQTT_CLIENT_ID, MQTT_USER,
                        MQTT_PASSWORD, 1883, "fw/online");

void setLight(int idx, HALightState state)
{
  leds.setPixelColor(idx, state.on ? Adafruit_NeoPixel::Color(
                                         state.red, state.green, state.blue)
                                   : 0);

  leds.show();
}

bool setLightL1(HALightState state)
{
  setLight(0, state);
  return true;
}

bool setLightL2(HALightState state)
{
  setLight(1, state);
  return true;
}

bool setLightL3(HALightState state)
{
  setLight(2, state);
  return true;
}

bool setLightL4(HALightState state)
{
  setLight(3, state);
  return true;
}

bool setLightL5(HALightState state)
{
  setLight(4, state);
  return true;
}

bool setLightL6(HALightState state)
{
  setLight(5, state);
  return true;
}

bool setLightL7(HALightState state)
{
  setLight(6, state);
  return true;
}

bool setLightR1(HALightState state)
{
  setLight(7, state);
  return true;
}

bool setLightR2(HALightState state)
{
  setLight(8, state);
  return true;
}

bool setLightR3(HALightState state)
{
  setLight(9, state);
  return true;
}

bool setLightR4(HALightState state)
{
  setLight(10, state);
  return true;
}

bool setLightR5(HALightState state)
{
  setLight(11, state);
  return true;
}

bool setLightR6(HALightState state)
{
  setLight(12, state);
  return true;
}

bool setLightR7(HALightState state)
{
  setLight(13, state);
  return true;
}

HALight lightL1("fw/l/1", "fw/l/1/c", setLightL1);
HALight lightL2("fw/l/2", "fw/l/2/c", setLightL2);
HALight lightL3("fw/l/3", "fw/l/3/c", setLightL3);
HALight lightL4("fw/l/4", "fw/l/4/c", setLightL4);
HALight lightL5("fw/l/5", "fw/l/5/c", setLightL5);
HALight lightL6("fw/l/6", "fw/l/6/c", setLightL6);
HALight lightL7("fw/l/7", "fw/l/7/c", setLightL7);
HALight lightR1("fw/r/1", "fw/r/1/c", setLightR1);
HALight lightR2("fw/r/2", "fw/r/2/c", setLightR2);
HALight lightR3("fw/r/3", "fw/r/3/c", setLightR3);
HALight lightR4("fw/r/4", "fw/r/4/c", setLightR4);
HALight lightR5("fw/r/5", "fw/r/5/c", setLightR5);
HALight lightR6("fw/r/6", "fw/r/6/c", setLightR6);
HALight lightR7("fw/r/7", "fw/r/7/c", setLightR7);

HASensor humidity("fw/humid");
HASensor temperature("fw/temp");

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

  manager.publishAvailabilityTopic();
}

void setup()
{
  Serial.begin(9600);

  leds.begin();
  leds.show();

  dht.begin();

  manager.connectWiFi(WIFI_SSID, WIFI_PASSWORD);
  manager.mqtt().setCallback(callback);

  manager.addDevice(&lightL1);
  manager.addDevice(&lightL2);
  manager.addDevice(&lightL3);
  manager.addDevice(&lightL4);
  manager.addDevice(&lightL5);
  manager.addDevice(&lightL6);
  manager.addDevice(&lightL7);
  manager.addDevice(&lightR1);
  manager.addDevice(&lightR2);
  manager.addDevice(&lightR3);
  manager.addDevice(&lightR4);
  manager.addDevice(&lightR5);
  manager.addDevice(&lightR6);
  manager.addDevice(&lightR7);
  manager.addDevice(&humidity);
  manager.addDevice(&temperature);

  update_dht_sensor();
}

uint32_t last_dht_poll_time = 0;

void loop()
{
  manager.loop();

  uint32_t now = millis();
  if (now - last_dht_poll_time > 60000)
  {
    update_dht_sensor();
    last_dht_poll_time = now;
  }
}
