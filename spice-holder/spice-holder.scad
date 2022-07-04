$fn = 360;

include <MCAD/regular_shapes.scad>


inner_diameter = 69.1;
cup_heigth = 40;
wall_height = 50;

hole_heigth = 20;
wall_thickness = 2.35;
bottom_thickness = wall_thickness * 1.1;

screw_diameter = 4.65;
screw_offset = 7.1;

lip_degree = 35;

//merge the holders
plate_width = inner_diameter + wall_thickness * 1.1;

for (i = [0 : 1 : 1]) {
    translate([0, i*plate_width, 0])
    complete();
}

module complete() {
    holder();
    
    translate([inner_diameter/2 + wall_thickness, -(inner_diameter+wall_thickness*2)/2, 0])
    rotate([0,0,90])
    wall_mount();

    extra();
    extra2();
}


module holder() {
    //bottom
    cylinder(bottom_thickness, r = inner_diameter/2 + wall_thickness);
    
    difference() {
        cylinder_tube(cup_heigth, inner_diameter/2 + wall_thickness, wall_thickness);
        
        // "lip"
        translate([-50, 0, cup_heigth*1.6])
        rotate([0, -lip_degree, 0])
        cube(plate_width, center = true);
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

module extra() {
    translate([inner_diameter/2 - wall_thickness, inner_diameter/5.2, 0])
    cube([wall_thickness*2, wall_thickness*1.5, cup_heigth]);

    translate([inner_diameter/2 - wall_thickness, -wall_thickness*6.83, 0])
    cube([wall_thickness*2, wall_thickness*1.5, cup_heigth]); 
}

module extra2() {
    difference() {
        cylinder_tube(bottom_thickness+2, inner_diameter/2, 2);
        
        translate([0, 0, 0])
        cylinder(h = bottom_thickness+3, r1 = inner_diameter/2 - 4, r2 = inner_diameter/2 +1, center = false);
    }
        
}