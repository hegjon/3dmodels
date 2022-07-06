$fn = 128;

include <MCAD/regular_shapes.scad>


inner_diameter = 68.92;
cup_heigth = 40;
wall_height = 50;

hole_heigth = 20;
wall_thickness = 1.70;
bottom_thickness = wall_thickness;

screw_diameter = 4.65;
screw_offset = 6.7;

lip_degree = 33;

//merge the holders
plate_width = inner_diameter + wall_thickness * 1.02;

for (i = [0 : 1 : 1]) {
    translate([0, i*plate_width, 0])
    complete();
}

module complete() {
    holder();
    
    translate([inner_diameter/2 + wall_thickness, -(inner_diameter+wall_thickness*2)/2, 0])
    rotate([0,0,90])
    wall_mount();

    //extra2();
}


module holder() {
    //bottom
    cylinder(bottom_thickness, r = inner_diameter/2 + wall_thickness);
    
    difference() {
        cylinder_tube(cup_heigth, inner_diameter/2 + wall_thickness, wall_thickness);
        
        // "lip"
        translate([-48, -0, cup_heigth])
        rotate([0, -lip_degree, 0])
        cube([plate_width*2, plate_width*2, plate_width/2], center = true);
    }
}

module wall_mount() {
    difference() {
        cube([inner_diameter + wall_thickness*2, wall_thickness, wall_height]);

        //holes for screws
        translate([plate_width-screw_offset, -1, wall_height-screw_offset])
        rotate([-90,0,0])
        cylinder(wall_thickness+2, d = screw_diameter);
            
        translate([screw_offset, -1, wall_height-screw_offset])
        rotate([-90,0,0])
        cylinder(wall_thickness+2,d = screw_diameter);        
    }
}

module extra2() {
    cylinder_tube(bottom_thickness+1.5, inner_diameter/2, 1.5);
}