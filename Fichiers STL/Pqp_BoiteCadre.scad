// CREPP 2018
// GPL V3.0
// yvoz.lg@gmail.com


//elecz = 47; // hauteur bas de plaque + composant mini
//bz = elecz + 3 + 2; //  boite total: 3mm en dessous (vis) 1mm de coque (haut et bas) 
//echo( bz/2 ); // 26

L = 14; // profil SVG
H = 27; 

px = 90; // bords de plaque
py = 150;
pz = 1.2; // épaisseur plaque
tx = (86+80)/2; // distance entre trous de plaque
ty = (143+137)/2;

accx = 14; // expace lateral pour accus

bx = tx + accx; // coins de position du profil
by = ty;
bz = H*2;

use<PotSolaire.scad>;
use<Cubo.scad>;

inf = false;

module coin_old(rt=180) rotate([0,0,rt]) 
    rotate_extrude(angle=90)
    translate([L/2,H/2,0]) import("Pqp_BoiteProfil.svg");

module coin(rt=180) rotate([0,0,rt]) difference(){
    rotate_extrude()
    translate([L/2,H/2,0]) import("Pqp_BoiteProfil.svg");
    translate([-30,0,-10]) cube(60);
    translate([0,-30,-10]) cube(60);
}

module bord(hot, rt){ 
    rotate([90,0,rt])
    linear_extrude(height=hot+0.1) // +0.1 sinon erreur !!!
    translate([L/2,H/2,0]) import("Pqp_BoiteProfil.svg");
}

translate([0,0,0]) bord(by, 180);
if(inf==true){ 
    translate([bx,0,0]) bord(bx, -90);
}else{
    $fn = 4*4;
    difference(){
        union(){
            epb = 4.16;
            translate([bx,0,0]) bord(bx, -90);
            translate([10,-L,bz/2]) rotate([-90,0,0]) cylinder(r=2+3, h=epb); // solaire 
            translate([15,-L,bz/2]) rotate([-90,0,0]) cylinder(r=1.8+3, h=epb); // pompe 3.5mm
            translate([20,-L,bz/2]) rotate([-90,0,0]) cylinder(r=1.5+3, h=epb); // humidité 3mm
            translate([25,-L,bz/2]) rotate([-90,0,0]) cylinder(r=1.5+3, h=epb); // luminosité 3mm
        }
        translate([10,-L-1,bz/2]) rotate([-90,0,0]) cylinder(r=2, h=20); // solaire 
        translate([15,-L-1,bz/2]) rotate([-90,0,0]) cylinder(r=1.8, h=20); // solaire 
        translate([20,-L-1,bz/2]) rotate([-90,0,0]) cylinder(r=1.5, h=20); // solaire 
        translate([25,-L-1,bz/2]) rotate([-90,0,0]) cylinder(r=1.5, h=20); // solaire 
        translate([5,-L-1,bz/2]) cube([50,50,10]);
    }
}
if(inf==true){ 
    $fn = 4*4;
    difference(){
        union(){
            epb = 4.16;
            translate([0,by,0]) bord(bx, 90);
            translate([10,by+L-epb,bz/2]) rotate([-90,0,0]) cylinder(r=2+3, h=epb); // solaire 4mm
            translate([15,by+L-epb,bz/2]) rotate([-90,0,0]) cylinder(r=1.8+3, h=epb); // pompe 3.5mm
            translate([20,by+L-epb,bz/2]) rotate([-90,0,0]) cylinder(r=1.5+3, h=epb); // humidité 3mm
            translate([25,by+L-epb,bz/2]) rotate([-90,0,0]) cylinder(r=1.5+3, h=epb); // luminosité 3mm
        }
        translate([10,by,bz/2]) rotate([-90,0,0]) cylinder(r=2, h=20);
        translate([15,by,bz/2]) rotate([-90,0,0]) cylinder(r=1.8, h=20);
        translate([20,by,bz/2]) rotate([-90,0,0]) cylinder(r=1.5, h=20);
        translate([25,by,bz/2]) rotate([-90,0,0]) cylinder(r=1.5, h=20);
        translate([5,by,bz/2]) cube([50,50,10]);
    }
}else{
    translate([0,by,0]) bord(bx, 90);
}
translate([bx,by,0]) bord(by, 0);


coin(0);
translate([bx,0,0]) coin(90);
translate([bx,by,0]) coin(180);
translate([0,by,0]) coin(-90);

    
module plaq() translate([accx,0,0]){
    trx = (px-tx)/2;
    try = (py-ty)/2;
    trz = 4;
    translate([-trx,-try,trz]) color("red") cube([px,py,pz]);
}

module accus() color("orange"){
    acw = 65;
    acr = 18/2;
    decalx = -2.5;
    decalz = 1;
    translate([decalx,3,bz/2-acr-decalz]) rotate([-90,0,0]) cylinder(r=acr, h=acw);
    translate([decalx,acw+7,bz/2-acr-decalz]) rotate([-90,0,0]) cylinder(r=acr, h=acw);
}

module suppaccus(){
    La = 26;
    Ha = 23; // profil SVG
    Lx = -14.134;
    translate([0,0,3]) rotate([90,0,180]) linear_extrude(height=10)
    translate([La/2+Lx,Ha/2,0]) import("Pqp_BoiteAccus.svg");
}


/*
translate([0,10,0]) suppaccus();
translate([0,69-20,0]) suppaccus();
translate([0,by-57,0]) suppaccus();
translate([0,by-17-2,0]) suppaccus();
*/

module visplaq(rt=180){
    difference(){
        union(){
            cpr = 1.5+2.5;
            color("orange") cylinder(r=cpr, h=3);
            rotate([0,0,rt]) translate([-cpr,0,0.5]) cubo([cpr*2,cpr*2-2,2.5],[4],4);
        }
        translate([0,0,-1]) cylinder(r=1.7, h=4-0.3);
    }
    difference(){
        color("orange") #cylinder(r=1.5+2.5, h=bz/2-1);
        translate([0,0,-1]) cylinder(r=1.5+2.5-0.3, h=bz);
    }
}

translate([accx,0,1])  visplaq(180);
translate([accx+tx,0,1])  visplaq(180);
translate([accx,ty,1])  visplaq(0);
translate([accx+tx,ty,1])  visplaq(0);

Lv = 15.650;
Hv = 7.650;
Hz = 1;

module visferm(rt=0){
    rotate([0,0,rt]) linear_extrude(height=3)
    translate([Lv/2,Hv/2-Hz,0]) import("Pqp_BoiteVisferm.svg");
}


translate([-L,L,bz/2-3]) visferm(90);
translate([-L,by-L-Lv,bz/2-3]) visferm(90);

translate([bx+L,L+Lv,bz/2-3]) visferm(-90);
translate([bx+L,by-L,bz/2-3]) visferm(-90);


module charniere(){
    chr = 8;
    chay = 70;
    translate([-30,by/2,bz/2-chr]) {
        rotate([0,0,90]) charpanosol(0);
        translate([-chr,0,0]) cube([chr-2,0.3,chr]);
        translate([-chr,chay/2-0.3,0]) cube([chr-2,0.3,chr]);
        translate([-chr,-chay/2,0]) cube([chr-2,0.3,chr]);
        translate([-chr,-chay/2,chr-0.3]) #cube([3,chay,0.3]);
    }
    translate([-30,35,bz/2-4]) cube([17,70,4]);
}

if( inf == true) charniere();
// plaq();
// accus();

module contre(rt=0){
    Lc = 10.062;
    Hc = 16.139;
    Hz = 0.453;
    translate([0,0,Hz]) rotate([90,0,rt]) linear_extrude(height=0.6)
    translate([Lc/2,Hc/2,0]) import("Pqp_BoiteContre.svg");
}

module contreforts(){
    // x
    translate([0,0,0]) contre(-90);
    translate([10.5,0,0]) contre(-90);
    translate([bx/2-10,0,0]) contre(-90);
    translate([bx/2+20,0,0]) contre(-90);
    translate([bx-3.5,0,0]) contre(-90);

    translate([0,by,0]) contre(90);
    translate([10,by,0]) contre(90);
    translate([bx/2-10,by,0]) contre(90);
    translate([bx/2+20,by,0]) contre(90);
    translate([bx-4.2,by,0]) contre(90);

    // y
    translate([bx,4.2,0]) contre(0);
    translate([bx,by/5,0]) contre(0);
    translate([bx,2*by/5,0]) contre(0);
    translate([bx,3*by/5,0]) contre(0);
    translate([bx,4*by/5,0]) contre(0);
    translate([bx,by-3.5,0]) contre(0);

    translate([0,4.2,0]) contre(180);
    translate([0,by/5,0]) contre(180);
    translate([0,2*by/5,0]) contre(180);
    translate([0,3*by/5,0]) contre(180);
    translate([0,4*by/5,0]) contre(180);
    translate([0,by-3.5,0]) contre(180);
}



module patch(){
    translate([-L-1,-L-1,bz/2-0.3]) color("green") #cube([L*2.5,L*2,0.3]);
    translate([bx-L+1,-L-1,bz/2-0.3]) color("green") #cube([L*2,L*2,0.3]);
    
    translate([-L-1,by-L+1,bz/2-0.3]) color("green") #cube([L*2.5,L*2,0.3]);
    translate([bx-L+1,by-L+1,bz/2-0.3]) color("green") #cube([L*2,L*2,0.3]);
}

contreforts();
patch();

