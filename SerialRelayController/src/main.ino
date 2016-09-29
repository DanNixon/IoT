/* #define DEBUG */

#define SERIAL_BAUD 9600

#define NUM_PINS 8
uint8_t PIN_MAPPING[] = {2, 3, 4, 5, 6, 7, 8, 9};

void setup()
{
  Serial.begin(SERIAL_BAUD);

  for (uint8_t i = 0; i < NUM_PINS; i++)
  {
    pinMode(PIN_MAPPING[i], OUTPUT);
    digitalWrite(PIN_MAPPING[i], HIGH);
  }

  Serial.println("UP");
}

void loop()
{
  if (Serial.available() >= 2)
  {
    uint8_t pinNum = Serial.parseInt();
    char onStatus = Serial.read();

    if (pinNum >= NUM_PINS)
    {
      Serial.println("FAIL");
      return;
    }

    bool on = onStatus != 'h';

#ifdef DEBUG
    Serial.println(pinNum);
    Serial.println(PIN_MAPPING[pinNum]);
    Serial.println(on);
#endif

    digitalWrite(PIN_MAPPING[pinNum], on);
    Serial.println("ACK");
  }
}
