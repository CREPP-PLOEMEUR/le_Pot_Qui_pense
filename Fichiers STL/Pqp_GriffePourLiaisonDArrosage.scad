# Pot qui pense - CREPP 2019
# GPL V3.0
# www.crepp.org - dranguy@yahoo.fr

difference () {
    
    union () {
cube ([10,40,40],center=true);
        translate ([15,0,-15])cube([20,20,10], center=true);
        
    }      
    translate ([0,0,3])cube ([3.8,45,40], center=true);
    translate([15,0,-15])cylinder(r=6,h=15,center=true,$fn=80);
  translate([-5,0,0])rotate([0,90,0])cylinder(r=1.5, h=8, center=true, $fn=80);
    translate([5,0,0]) rotate([0,90,0])cylinder(r=3.2, h=8, center=true, $fn=80);
    
}
