// CREPP 2018
// GPL V3.0
// dranguy@yahoo.fr


difference () {
    
    union () {
        
        cube ([120,30,10], center=true);
        translate ([-37,6.5,8]) cube([4,17,10], center=true);
        translate([37,6.5,8]) cube([4,17,10], center=true);
        translate([-37,6.5,12]) rotate ([0,90,0]) cylinder (r= 8.5, h= 4, center=true,$fn=80);
        translate([37,6.5,12]) rotate ([0,90,0]) cylinder (r=8.5, h= 4, center=true, $fn=80);
        
        
        
        }
        
        translate([0,-2.5,0]) cube([122,29,3.7], center=true);
       translate([0,6,13]) rotate([0,90,0]) cylinder(r=1.8, h=80, center=true, $fn=80);
        translate([0,-4,-3]) cube([80,25,4.5], center=true);
    
}