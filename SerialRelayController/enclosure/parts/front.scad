use <Suwako/BoltAndTabBox.scad>
include <../config.scad>

module FrontPanel()
{
  difference()
  {
    XZPanel2D(box_config);

    translate(FRONT_CABLE_ACCESS_POSITION)
      square(FRONT_CABLE_ACCESS_DIMS, center = true);
  }
}

FrontPanel();
