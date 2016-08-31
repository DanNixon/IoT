#include <Adafruit_SSD1306.h>
#include <MCP23S17.h>

Adafruit_SSD1306 g_oled;

MCP g_inputA(1, 10);
MCP g_inputB(2, 10);
MCP g_outputA(3, 10);
MCP g_outputB(4, 10);

#if (SSD1306_LCDHEIGHT != 64)
#error("Height incorrect, please fix Adafruit_SSD1306.h!");
#endif

void setup()
{
  /* Initialise OLED display */
  g_oled.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  g_oled.display();

  /* Initialise port expanders (buttons) */
  g_inputA.begin();
  g_inputB.begin();

  /* Initialise port expanders (LEDs) */
  g_outputA.begin();
  g_outputB.begin();
}

void loop()
{
  delay(100);
}
