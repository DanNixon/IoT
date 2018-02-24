#include <Adafruit_NeoPixel.h>
#include <HADeviceManager.h>
#include <HALight.h>

#include "config.h"

#define MQTT_VERSION MQTT_VERSION_3_1_1

Adafruit_NeoPixel leds(11, D7, NEO_BRG + NEO_KHZ800);

HADeviceManager manager(MQTT_SERVER_IP, MQTT_CLIENT_ID, MQTT_USER,
                        MQTT_PASSWORD, 1883, "lights/garage/online");

bool setLight(HALightState state)
{
  leds.setBrightness(state.brightness);
  leds.show();

  for (int i = 0; i < leds.numPixels(); i++)
  {
    leds.setPixelColor(i, state.on ? Adafruit_NeoPixel::Color(
                                         state.red, state.green, state.blue)
                                   : 0);
    leds.show();
  }

  return true;
}

HALight light(
    "lights/garage/workbench",
    "lights/garage/workbench/cmd",
    setLight);

void callback(char *topic, byte *payload, unsigned int len)
{
  manager.mqttCallback(topic, payload, len);
}

void setup()
{
  Serial.begin(9600);

  leds.begin();
  leds.show();

  manager.connectWiFi(WIFI_SSID, WIFI_PASSWORD);
  manager.mqtt().setCallback(callback);

  manager.addDevice(&light);
}

void loop()
{
  manager.loop();
}
