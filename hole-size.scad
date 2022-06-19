//round holes
$fn = 64;

first = 3;
last = 7;

width = last + 12;
thickness = 2.5;

ruler("F");

translate([0,10,10])
rotate([90, 0, 0])
ruler("W");

module ruler(prefix) {
    
    
    diff = first*28-20;
    union() {
        translate([0, -width/2, 0])
        cube([160, width, thickness]);

        translate([10, 4, -1])
        linear_extrude(1.5)
                text(prefix, size = 5, halign = "center");    

        for (i = [first : 0.5 : last]){
            
            translate([i*28 - diff, 4, -1])
            cylinder_and_text(i);
        }
    }
}

module cylinder_and_text(size) {
    cylinder(thickness+2, d = size);

    translate([0, -10, thickness])
    linear_extrude(1.5)
            text(str(size), size = 5, halign = "center");    
}