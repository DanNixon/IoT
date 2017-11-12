use <Suwako/BoltAndTabBox.scad>
include <../config.scad>

module BottomPanel()
{
  difference()
  {
    XYPanel2D(box_config);

    dx = RELAY_BOARD_HOLE_CENTRES[0] / 2;
    dy = RELAY_BOARD_HOLE_CENTRES[1] / 2;

    for (x = [-dx, dx])
      for (y = [-dy, dy])
        translate([x, y])
          circle(d = RELAY_BOARD_HOLE_DIAMETER);
  }
}

BottomPanel();
