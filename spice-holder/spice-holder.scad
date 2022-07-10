$fn = 360;

include <BOSL2/std.scad>

number_of_cups = 5;

inner_diameter = 68.8;
cup_heigth = 41;
wall_height = 50;

mount_thickness = 1.75; //5*0.35
cup_thickness = 1.40; //4*0.35
bottom_thickness = mount_thickness;

screw_diameter = 4.65;
screw_offset = 6.7;

lip_degree = 30;

//private variables
//merge the holders
plate_width = inner_diameter + cup_thickness;
total_width = plate_width*number_of_cups;

xcopies(n=number_of_cups, spacing=plate_width) {
    holder();
}
wall_mount();

module wall_mount() {
     back(inner_diameter/2)
     difference() {
        left(total_width/2)
        cube([total_width, mount_thickness, wall_height]);
        
        //corner holes
        back(mount_thickness/2)
        up(wall_height-screw_offset)
        xcopies(n=2, l=total_width - screw_offset*2) {
            ycyl(l=mount_thickness+0.1, d=screw_diameter);
        }
        
        //between cups
        number_of_holes_in_middle = number_of_cups-1;
        back(mount_thickness/2)
        up(wall_height-screw_offset)
        xcopies(n=number_of_holes_in_middle, l=plate_width*(number_of_cups-2)) {
            ycyl(l=mount_thickness+0.1, d=screw_diameter);
        }        
     }
}

module holder() {
    //bottom
    cylinder(bottom_thickness, r = inner_diameter/2 + cup_thickness);
    
    difference() {
        tube(h=cup_heigth, id=inner_diameter, wall=cup_thickness, anchor=BOTTOM);
        
        // "lip"
        up(cup_heigth/6.6)
        right(inner_diameter/2)
        fwd(inner_diameter)
        rotate([0, -lip_degree, 90])
        cube([cup_heigth*2, plate_width, cup_heigth]);
    }
}