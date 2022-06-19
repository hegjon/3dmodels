structure_thickness = 3;
width = 8;
wall_thickness = 8.6;

length = 25;
hook_depth = 8;
hook_heigth = 4.5;

//right towards the wall
translate([0, wall_thickness, 0])
cube([length, structure_thickness, width]);


//left towards the wall
translate([0, -structure_thickness, 0])
cube([length, structure_thickness, width]);

bottom_x = length - hook_heigth - structure_thickness;
//rigth hook
translate([bottom_x, wall_thickness + hook_depth + structure_thickness, 0])
cube([hook_heigth + structure_thickness, structure_thickness, width]);

//left hook
translate([bottom_x, -(structure_thickness*2 + hook_depth), 0])
cube([hook_heigth + structure_thickness, structure_thickness, width]);


//flats
rotate([0, 0, 90])
union() {
    
    //top
    translate([-structure_thickness, 0, 0])
    cube([wall_thickness + structure_thickness*2, structure_thickness, width]);

    //left
    translate([-structure_thickness - hook_depth, -length, 0])
    cube([hook_depth, structure_thickness, width]);
    
    //right
    translate([wall_thickness+structure_thickness, -length, 0])
    cube([hook_depth, structure_thickness, width]);
}

