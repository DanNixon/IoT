#include <MCP23S17.h>

MCP g_inputA(1, 10);
MCP g_inputB(2, 10);
MCP g_outputA(3, 10);
MCP g_outputB(4, 10);

void setup()
{
  g_inputA.begin();
  g_inputB.begin();
  g_outputA.begin();
  g_outputB.begin();
}

void loop()
{
  delay(100);
}
