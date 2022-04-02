# Pot qui pense - CREPP 2019
# GPL V3.0
# www.crepp.org - dranguy@yahoo.fr

difference( ){
        union () {
cube([25,25,25], center=true);
            translate([0,26,0])cube([25,30,25], center=true);
    translate([16,0,0]) rotate ([0,90,0])cylinder(r=4.5, h=15, center=true, $fn=80);
    translate([-16,0,0]) rotate ([0,90,0])cylinder(r=4.5,h=15, center=true, $fn=80);
    translate([0,0,14])cylinder(r=4.5, h=17, center=true, $fn=80);
    }
translate([-5,0,0]) rotate([0,90,0]) cylinder(r=3, h=40, center=true, $fn=80); 
translate([0,0,16])cylinder(r=3, h=30, center=true,$fn=80); 
    translate([0,30,0]) rotate([90,0,0]) cylinder(r=1.4, h=30, center=true, $fn=80);
    
    }
