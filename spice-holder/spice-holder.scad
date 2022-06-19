$fn = 64;

include <MCAD/regular_shapes.scad>


inner_diameter = 68;
cup_heigth = 45;
wall_height = 55;

hole_heigth = 20;
wall_thickness = 3;
screw_diameter = 4.8;

//merge the holders
plate_width = inner_diameter + wall_thickness * 1.5;

for (i = [0 : 1 : 4]){    
    translate([0, i*plate_width, 0])
    complete();
}

module complete() {
    holder();
    
    translate([inner_diameter/2 + wall_thickness, -(inner_diameter+wall_thickness*2)/2, 0])
    rotate([0,0,90])
    wall_mount();
}
//
module holder() {
    cylinder(wall_thickness, r = inner_diameter/2 + wall_thickness);
    
    difference() {
        cylinder_tube(cup_heigth, inner_diameter/2 + wall_thickness, wall_thickness);
        translate([-40, 0, cup_heigth*1.6])
        rotate([0, -30, 0])
        cube(plate_width, center = true);
    }
}

module wall_mount() {
    difference() {
        cube([inner_diameter + wall_thickness*2, wall_thickness, wall_height]);

        //holes for screws
        translate([plate_width-7, -1, wall_height-7])
        rotate([-90,0,0])
        cylinder(wall_thickness+2, d = screw_diameter);
            
        translate([7, -1, wall_height-7])
        rotate([-90,0,0])
        cylinder(wall_thickness+2,d = screw_diameter);        
    }
}