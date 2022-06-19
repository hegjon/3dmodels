structure_thickness = 3;
width = 8;
wall = 8.7;

length = 25;
hook_size = 8;


//right towards the wall
translate([0, wall, 0])
cube([length, structure_thickness, width]);


//left towards the wall
translate([0, -structure_thickness, 0])
cube([length, structure_thickness, width]);

//rigth hook
translate([length - hook_size, wall + hook_size + structure_thickness, 0])
cube([hook_size, structure_thickness, width]);

//left hook
translate([length - hook_size, -(structure_thickness*2 + hook_size), 0])
cube([hook_size, structure_thickness, width]);


//flats
rotate([0, 0, 90])
union() {
    
    //top
    translate([-structure_thickness, 0, 0])
    cube([wall + structure_thickness*2, structure_thickness, width]);

    //left
    translate([-structure_thickness - hook_size, -length, 0])
    cube([hook_size, structure_thickness, width]);
    
    //right
    translate([wall+structure_thickness, -length, 0])
    cube([hook_size, structure_thickness, width]);
}

