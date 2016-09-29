/* Box */
internal = [150, 60, 25];
material_thickness = 3;
outer_padding = 5;

screw_radius = 1.75;
xy_screws = [0];
xz_screws = [];

xy_tab_width = 10;
xy_tabs = [-18, 18];
xz_tab_width = 10;
xz_tabs = [0];

box_config = [
    internal,
    [material_thickness, 0.1],
    outer_padding,
    [screw_radius, xy_screws, xz_screws],
    [[xy_tab_width, xy_tabs], [xz_tab_width, xz_tabs]]
  ];

/* Relay board */
RELAY_BOARD_HOLE_CENTRES = [134, 51];
RELAY_BOARD_HOLE_DIAMETER = 3.1;

/* Screw access */
SCREW_ACCESS_CUTOUT_POSITION = [0, -22];
SCREW_ACCESS_CUTOUT_DIMS = [125, 15];

/* Front cable access */
FRONT_CABLE_ACCESS_POSITION = [0, -5];
FRONT_CABLE_ACCESS_DIMS = [130, 10];

/* UART header */
UART_HEADER_POSITION = [20, 8];
UART_HEADER_DIMS = [15, 6];
