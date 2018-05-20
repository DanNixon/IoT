#include <SPI.h>
#include <Wire.h>

#include <Adafruit_BMP085.h>
#ifdef USE_OLED
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#endif
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <HADeviceManager.h>
#include <HASensor.h>

#include "config.h"

#define MQTT_VERSION MQTT_VERSION_3_1_1

#define NODE_NAME "ground_floor"

DHT dht(D4, DHT11);
Adafruit_BMP085 bmp;

#ifdef USE_OLED
Adafruit_SSD1306 display(0);
#endif

HADeviceManager manager(MQTT_SERVER_IP, MQTT_CLIENT_ID, MQTT_USER,
                        MQTT_PASSWORD, 1883, NODE_NAME "/online");

HASensor humidity(NODE_NAME "/humidity");
HASensor temperature(NODE_NAME "/temperature");
HASensor pressure(NODE_NAME "/pressure");

void setup()
{
  Serial.begin(9600);

  /* Init sensors */
  dht.begin();
  bmp.begin();

#ifdef USE_OLED
  /* Init display */
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.display();

  /* Clear display */
  display.clearDisplay();
  display.display();
#endif

  /* Init device manager */
  manager.connectWiFi(WIFI_SSID, WIFI_PASSWORD);
  manager.mqtt().setCallback(callback);

  manager.addDevice(&humidity);
  manager.addDevice(&temperature);
  manager.addDevice(&pressure);

  /* Initial sensor update */
  update_sensors();
}

void callback(char *topic, byte *payload, unsigned int len)
{
  manager.mqttCallback(topic, payload, len);
}

void update_sensors()
{
  /* Read sensor values */
  float h = dht.readHumidity();
  float t = bmp.readTemperature();
  float p = bmp.readPressure();

  /* Update Home Assistant sensors */
  humidity.updateSensorFloat(h);
  temperature.updateSensorFloat(t);
  pressure.updateSensorFloat(p);
  manager.publishAvailabilityTopic();

#ifdef USE_OLED
  /* Update display */
  display.clearDisplay();
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.setCursor(0, 0);

  display.print((int)t);
  display.println(" C");

  display.print((int)h);
  display.println(" %");

  display.display();
#endif
}

uint32_t last_sesnor_poll_time = 0;

void loop()
{
  manager.loop();

  uint32_t now = millis();

  if (now - last_sesnor_poll_time > 60000)
  {
    update_sensors();
    last_sesnor_poll_time = now;
  }
}
