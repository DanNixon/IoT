#include <DHT.h>
#include <HADeviceManager.h>
#include <HASensor.h>

#include "config.h"

#define MQTT_VERSION MQTT_VERSION_3_1_1

DHT dht(D4, DHT22);

HADeviceManager manager(MQTT_SERVER_IP, MQTT_CLIENT_ID, MQTT_USER,
                        MQTT_PASSWORD, 1883, NODE_NAME"/online");

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

void setup()
{
  Serial.begin(9600);

  dht.begin();

  manager.connectWiFi(WIFI_SSID, WIFI_PASSWORD);
  manager.mqtt().setCallback(callback);

  manager.addDevice(&humidity);
  manager.addDevice(&temperature);
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
