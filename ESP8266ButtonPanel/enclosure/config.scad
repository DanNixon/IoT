internal = [120, 100, 40];
material_thickness = 3;
outer_padding = 5;

screw_radius = 1.75;
xy_screws = [];
xz_screws = [];

xy_tab_width = 20;
xy_tabs = [];
xz_tab_width = 10;
xz_tabs = [];

box_config = [
    internal,
    [material_thickness, 0.1],
    outer_padding,
    [screw_radius, xy_screws, xz_screws],
    [[xy_tab_width, xy_tabs], [xz_tab_width, xz_tabs]]
  ];
