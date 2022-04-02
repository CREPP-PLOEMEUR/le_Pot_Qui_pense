// CREPP 2018
// GPL V3.0
// yvoz.lg@gmail.com

oe = 3; // épaisseur parois

pw = 135; // W: X ou Y du pot (
pr = 30; // rayon des coins de pot (largeur total du pot : pr + pw + pr
pz = 180;

j = 1;//0.5; // jeux d'emboitement
bz = 15; // hauteur d'emboitement

$fn = 32*4;

chw = 70; // W: X ou Y de la charnière
chr = 8; // rayon charnières
axr = 3; // rayon axe
jj = 0.3; // jeux charnière

0w = pw/2; // centre du pot
0z = bz/2+oe/2+j/2; // centre Z collier

// panneau solaire

pox = 131; // panneau solaire 130*150
poz = 151; 
pob = 6; // bord
porr = 14; // rayon coins

// --- Niveaux ( 3 nivaux )
niv = 3;

if(niv == 0){
	pot();
	translate([0, 0, pz-bz+j]) color("orange") collier();
	translate([0w, 0w+(pw/2+j+oe+jj+chr), pz+j-bz+0z]) rotate([-45,0,0]) panosol();
}
if(niv==1) pot();
if(niv==2) rotate([0,180,0]) color("orange") collier();
if(niv==3) panosol();
	
//surimp = 175; // surface d'impression 195 * 195
//translate([-20,-20,155]) cube([surimp,surimp,1]);
// --------------- Pot
module pot() difference(){
	minkowski() {
		translate([pr,pr,0]) cube([pw-pr*2,pw-pr*2,pz]);
		cylinder(r=pr, h=1);
	}

	minkowski() {
		translate([pr,pr,oe]) cube([pw-pr*2,pw-pr*2,pz]);
		cylinder(r=pr-oe, h=1);
	}
}

// --------------- Charniere
module charniere() difference(){ 
	hull(){
		translate([pw/2+j+oe+jj+chr, chw/2+jj, 0]) sphere(r=chr);
		translate([chw/2+jj, pw/2+j+oe+jj+chr, 0]) sphere(r=chr);
	}
	// evidement charnières
	tt = chr*3;
	translate([pw/2+j+oe+jj+chr-tt/2, chw/2+jj-tt, -tt/2]) cube(tt);
	translate([chw/2+jj-tt, pw/2+j+oe+jj+chr-tt/2, -tt/2]) cube(tt);
	// vis d'axe charnières
	translate([pw/2+j+oe+jj+chr, chw/2+jj, 0]) rotate([-90,0,0]) cylinder(r=axr, h=chr*2);
	translate([chw/2+jj, pw/2+j+oe+jj+chr, 0]) rotate([ 0,90,0]) cylinder(r=axr, h=chr*2);
}

// ---------- Couvercle
module collier() difference(){
	union(){
		minkowski() {
			translate([pr,pr,0]) cube([pw-pr*2,pw-pr*2, bz+oe]);
			cylinder(r=pr+j+oe, h=1);
		}
		// boules charnières
		translate([0w,0w,0z]) charniere();
		translate([0w,0w,0z]) rotate([0,0,90]) charniere();
		translate([0w,0w,0z]) rotate([0,0,180]) charniere();
		translate([0w,0w,0z]) rotate([0,0,-90]) charniere();
	}
	
	// emboitement
	minkowski() {
		translate([pr,pr,-1]) cube([pw-pr*2,pw-pr*2,bz+1]);
		cylinder(r=pr+j, h=1);
	}
	// evidement central
	minkowski() {
		translate([pr,pr,-1]) cube([pw-pr*2,pw-pr*2,bz+oe+2]);
		cylinder(r=pr-oe*2, h=1);
	}
}

// -------- Panosol

module panosol(){
    charpanosol();
	//
	decy = 4;
	translate([0, 0, -chr]) {
		difference(){
			union(){
				// plaque de jonction
				translate([-chw/2, 0, 0]) cube([chw, chw-porr*2, oe*2]);
				// cadre de panneau
				minkowski() {
					translate([-pob-pox/2+porr, decy+pob+porr, 0]) 
					cube([pob+pox+pob-porr*2, pob+poz+pob-porr*2, 1+oe]);
					cylinder(r=porr, h=1);
				}
			}
			translate([-pox/2, decy+pob+pob, 1]) cube([pox, poz, oe*3]);
			//
			translate([0, decy+pob+pob+poz/2, -1]) cylinder(r=20, h=oe*3);
			translate([0, decy+pob+pob+poz/2 -50, -1]) cylinder(r=20, h=oe*3);
			translate([0, decy+pob+pob+poz/2 +50, -1]) cylinder(r=20, h=oe*3);
			//
			translate([-40, decy+pob+pob+poz/2 -25, -1]) cylinder(r=20, h=oe*3);
			translate([-40, decy+pob+pob+poz/2 +25, -1]) cylinder(r=20, h=oe*3);
			//
			translate([40, decy+pob+pob+poz/2 -25, -1]) cylinder(r=20, h=oe*3);
			translate([40, decy+pob+pob+poz/2 +25, -1]) cylinder(r=20, h=oe*3);
			// fils elec
			translate([-pox/2+6, decy+pob+pob+3, -1]) cube([25,12,oe*3]);
		}
	}
}

module charpanosol(jonc=0){	
    difference(){
		translate([-chw/2, 0, 0]) rotate([0,90,0]) cylinder(r=chr, h=chw);
		// vis axe de charnière
		translate([-chw/2-1, 0, 0]) rotate([0,90,0]) cylinder(r=1.7, h=chw+2);
	}
    // plaque de jonction
    if(jonc){
        translate([-chw/2, 0, -chr]) cube([chw, chw-porr*2, oe*2]);
    }
}




