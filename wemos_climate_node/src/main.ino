#include <Wire.h>
#include <SPI.h>

#include <Adafruit_GFX.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP085.h>
#include <Adafruit_SSD1306.h>
#include <DHT.h>

DHT dht(D4, DHT11);
Adafruit_BMP085 bmp;

Adafruit_SSD1306 display(0);

void setup()
{
  Serial.begin(9600);

  /* Init sensors */
  dht.begin();
  bmp.begin();

  /* Init display */
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.display();

  /* Clear display */
  display.clearDisplay();
  display.display();

  /* Text demo */
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0,0);
  display.println("Hello, world!");
  display.display();
}

uint32_t last_dht_poll_time = 0;

void loop()
{
  Serial.print("Humidity (DHT) = ");
  Serial.print(dht.readHumidity());
  Serial.println(" %");

  Serial.print("Temperature (DHT) = ");
  Serial.print(dht.readTemperature());
  Serial.println(" *C");

  Serial.print("Temperature (BMP) = ");
  Serial.print(bmp.readTemperature());
  Serial.println(" *C");

  Serial.print("Pressure (BMP) = ");
  Serial.print(bmp.readPressure());
  Serial.println(" Pa");

  Serial.println();

  delay(2000);
}
