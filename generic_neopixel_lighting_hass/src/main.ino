#include <Adafruit_NeoPixel.h>
#include <HADeviceManager.h>
#include <HALight.h>

#include "config.h"

#define MQTT_VERSION MQTT_VERSION_3_1_1

Adafruit_NeoPixel leds(PIXEL_COUNT, PIXEL_PIN, PIXEL_MODE);

HADeviceManager manager(MQTT_SERVER_IP, MQTT_CLIENT_ID, MQTT_USER,
                        MQTT_PASSWORD);

bool setLight(HALightState state)
{
  leds.setBrightness(state.brightness);
  leds.show();

  for (int i = 0; i < PIXEL_COUNT; i++)
  {
    leds.setPixelColor(i, state.on ? Adafruit_NeoPixel::Color(
                                         state.red, state.green, state.blue)
                                   : 0);
    leds.show();
  }

  return true;
}

HALight light(STATE_TOPIC, COMMAND_TOPIC, setLight);

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
