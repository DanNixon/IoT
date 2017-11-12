use <Suwako/BoltAndTabBox.scad>
include <../config.scad>

module RightPanel()
{
  difference()
  {
    YZPanel2D(box_config);

    translate(UART_HEADER_POSITION)
      square(UART_HEADER_DIMS, center = true);
  }
}

RightPanel();
