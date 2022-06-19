include <MCAD/regular_shapes.scad>

heigth = 45;

plate_width = 50;
hole_heigth = 21;
wall_size = 3.5;

screw_hole_diameter = 4.75;
screw_hole_from_edge = 7.5;

difference() {
    $fn = 12;
    union() {        
        cylinder_tube(heigth,15, wall_size, center=true);
        
        rotate(26)
        translate([-8,0,0])
            cube([42, wall_size, heigth], center=true);

        rotate(-26)
        translate([-8,0,0])
            cube([42, wall_size, heigth], center=true);
    }
    
    //hole for strips
    cylinder_tube(hole_heigth,18.5, 3.5, center = true);
}

translate([-26,8,0])
rotate([0,0,90])
difference() {
    cube([plate_width, wall_size, heigth], center = true);

    $fn = 64;
    
    //screw holes
    translate([(plate_width/2)-screw_hole_from_edge, 0, (heigth/2)-screw_hole_from_edge])
    rotate([-90,0,0])
    cylinder(10, d = screw_hole_diameter, center=true);
        
    translate([(plate_width/2)-screw_hole_from_edge, 0, -(heigth/2)+screw_hole_from_edge])
    rotate([-90,0,0])
    cylinder(10,d = screw_hole_diameter,center=true);
  

}