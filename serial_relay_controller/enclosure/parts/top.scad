use <Suwako/BoltAndTabBox.scad>
include <../config.scad>

module TopPanel()
{
  difference()
  {
    XYPanel2D(box_config);

    translate(SCREW_ACCESS_CUTOUT_POSITION)
      square(SCREW_ACCESS_CUTOUT_DIMS, center = true);
  }
}

TopPanel();
