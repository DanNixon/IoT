/* #define DEBUG */

#define SERIAL_BAUD 9600

#define LED_PIN 13

#define NUM_PINS 8
uint8_t PIN_MAPPING[] = {2, 3, 4, 5, 6, 7, 8, 9};

#define ALL_PINS -1

#define LED_ON                                                                 \
  {                                                                            \
    digitalWrite(LED_PIN, HIGH);                                               \
  }

#define LED_OFF                                                                \
  {                                                                            \
    digitalWrite(LED_PIN, LOW);                                                \
  }

#define PROTOCOL_FAIL                                                          \
  {                                                                            \
    Serial.println("FAIL");                                                    \
    LED_OFF                                                                    \
    return;                                                                    \
  }

#define PROTOCOL_ACK                                                           \
  {                                                                            \
    Serial.println("ACK");                                                     \
    LED_OFF                                                                    \
    return;                                                                    \
  }

void setup()
{
  Serial.begin(SERIAL_BAUD);

  pinMode(LED_PIN, OUTPUT);
  LED_ON

  for (uint8_t i = 0; i < NUM_PINS; i++)
  {
    pinMode(PIN_MAPPING[i], OUTPUT);
    digitalWrite(PIN_MAPPING[i], HIGH);
  }

  Serial.println("UP");
  LED_OFF
}

void loop()
{
  if (Serial.available() >= 2)
  {
    int8_t pinNum = Serial.parseInt();
    char command = Serial.read();

    LED_ON

    if (pinNum != ALL_PINS && pinNum >= NUM_PINS)
      PROTOCOL_FAIL

    bool currestState = false;
    if (pinNum != ALL_PINS)
      currestState = !digitalRead(PIN_MAPPING[pinNum]);

    bool on = false;
    switch (command)
    {
    case 'h':
      on = true;
      break;

    case 'l':
      on = false;
      break;

    case 't':
      if (pinNum == ALL_PINS)
        PROTOCOL_FAIL
      on = !currestState;
      break;

    case 'q':
      if (pinNum == ALL_PINS)
        PROTOCOL_FAIL
      Serial.println(currestState);
      LED_OFF
      return;

    default:
      PROTOCOL_FAIL
    }

#ifdef DEBUG
    Serial.println(pinNum);
    Serial.println(PIN_MAPPING[pinNum]);
    Serial.println(on);
#endif

    if (pinNum == ALL_PINS)
    {
      for (uint8_t i = 0; i < NUM_PINS; i++)
        digitalWrite(PIN_MAPPING[i], !on);
    }
    else
      digitalWrite(PIN_MAPPING[pinNum], !on);

    PROTOCOL_ACK
  }
}
