// CREPP 2019
// GPL V3.0
// www.crepp.org - yvoz.lg@gmail.com

// include <Pqp_BoiteCadre.scad>;
ty = (143+137)/2; // distance entre trous de plaque

include <Hexa.scad>;
use <Cubo.scad>;

ep = 0.3*7; // 2.1
tz = 7;

ix = 1.5;
iy = 5;

my = 20;

$fn = 4*4;

difference(){
    union(){
        hull(){
            translate([ep+1.5,0,0]) cylinder(r=1.5+ep, h=tz);
            translate([ep+1.5+ep/4,0,0]) cylinder(r=1.5+ep, h=tz);
        }
        hull(){
            translate([ep+1.5,ty,0]) cylinder(r=1.5+ep, h=tz);
            translate([ep+1.5+ep/4,ty,0]) cylinder(r=1.5+ep, h=tz);
        }
        // chanfreins
        cubo([ep+ep-0.2,1.5+ep+ep,tz], [11], 3);
        translate([0,ty-(1.5+ep+ep),0]) cubo([ep+ep-0.2,1.5+ep+ep,tz], [12], 3);
    }
    translate([ep+1.5+ep/4,0,0]) cylinder(r=1.7, h=tz+2);
    translate([ep+1.5+ep/4,ty,0]) cylinder(r=1.7, h=tz+2);
}


translate([0,my,0]) cubo([ep,ty-my*2,tz*3], [9,10], 1.4);
translate([0,my,0]) cube([ep,ty-my*2,tz]);


module rizlan(myy) difference(){
    union(){
        cube([ep+ep/4-0.2,my,tz]);
        hull(){
            translate([ep+ix/2,myy,0]) cylinder(r=ix/2+ep*0.5, h=tz*3);
            translate([ep+ix/2,myy+iy,0]) cylinder(r=ix/2+ep*0.5, h=tz*3);
        }
    }
    hull(){
        translate([ep+ix/2,myy,0]) cylinder(r=ix/2, h=tz*3+3);
        translate([ep+ix/2,myy+iy,0]) cylinder(r=ix/2, h=tz*3+3);
    }
}

rizlan(my);
translate([0,ty-my,0]) rizlan(-iy);

