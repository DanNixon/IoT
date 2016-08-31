#include <SSD1306.h>
#include <MCP23S17.h>

SSD1306 g_oled(0x3c, D3, D4);

MCP g_inputA(1, 10);
MCP g_inputB(2, 10);
MCP g_outputA(3, 10);
MCP g_outputB(4, 10);

void setup()
{
  /* Initialise OLED display */
  g_oled.init();
  g_oled.setFont(ArialMT_Plain_10);

  /* Initialise port expanders (buttons) */
  g_inputA.begin();
  g_inputB.begin();

  /* Initialise port expanders (LEDs) */
  g_outputA.begin();
  g_outputB.begin();
}

void loop()
{
  g_oled.clear();
  g_oled.setTextAlignment(TEXT_ALIGN_LEFT);
  g_oled.setFont(ArialMT_Plain_10);
  char buff[30];
  snprintf(buff, 30, "time=%d", millis());
  g_oled.drawString(0, 0, buff);
  g_oled.display();

  delay(100);
}
