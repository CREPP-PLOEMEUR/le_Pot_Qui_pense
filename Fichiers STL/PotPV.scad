// CREPP 2018
// GPL V3.0
// yvoz.lg@gmail.com

oe = 3.5+1;
pir = 5;   // rayon interne des coins du pot

pvw = 247; // largeur Pot
pvz = 240; // hauteur Pot

//----- Charnière du panneau
chw = 70; // W: largeur de la charnière coté panneau
chr = 8; // rayon charnière
axr = 3; // rayon axe pivot de charnière
jj = 0.4; // jeux charnière 

module pot(){
	translate([0,0,pvz-60]) pyramide(pvw, pvw-18, 60);
	translate([0,0, pvz-60-5]) pyramide(pvw-17, pvw-30, 5);
	pyramide(pvw-30, pvw-70, pvz-60);
}

dely = 10; // décalage de l'axe de charnière / au bord du pot
delz = 25; // hauteur d'emboitement des coins sur le pot

pot();
translate([0,pvw/2+dely,pvz]) rotate([-40,0,0]) panosol();
translate([-pvw/2-dely,0,pvz]) rotate([0,0,90]) rotate([-60,0,0]) panosol();
translate([0,0,pvz-60]) anglo(false);


// ########## rotate([0,180,0]) anglo();

//---- anglo
module anglo(print){
	
	// affichage de construction à conserver
	//pyramide(pvw, pvw-18, 60);
	//translate([0,pvw/2+dely,60]) panosol();

	croisw = (pvw-chw)/2 +dely; // bord charnière jusqu'au coin
	rotate([0,0,0]) gons(1);
	rotate([0,0,90]) gons(0);
	if(print==false){
		rotate([0,0,180]) gons(1);
		rotate([0,0,-90]) gons(0);
	}
	translate([-pvw/2-dely, pvw/2+dely, 60]) sphere(r=chr);
	module gons(left){ 
		difference(){
			union(){
				translate([0,pvw/2+dely,60]){
						translate([chw/2+jj, 0, 0]) rotate([0,90,0]) cylinder(r=chr, h=croisw);
						translate([-chw/2-jj, 0, 0]) rotate([0,-90,0]) cylinder(r=chr, h=croisw);
						//
						translate([chw/2+jj, -dely-oe*2-1, -chr]) cube([croisw-jj, dely+oe*2+1, chr*2]);
						translate([chw/2+jj, -dely-oe*3-1, -delz]) rotate([-9,0,0]) 
								color("orange") cube([croisw-chr-jj*2, oe*3+3, delz+chr]);
						//
						translate([-chw/2-croisw, -dely-oe*2-1, -chr]) cube([croisw-jj, dely+oe*2+1, chr*2]);
						translate([-chw/2-croisw+chr+jj, -dely-oe*3-1, -delz]) rotate([-9,0,0]) 
								color("green") cube([croisw-chr-jj*2, oe*3+3, delz+chr]);
				}
			}
			pyramide(pvw, pvw-18, 60);
			//
			translate([0,pvw/2+dely,60]){
				translate([chw/2+jj, 0, 0]) rotate([0,90,0]) #cylinder(r=axr, h=croisw);
				translate([-chw/2-jj, 0, 0]) rotate([0,-90,0]) #cylinder(r=axr, h=croisw);
			}
			// 
			if(print){
				if(left){
					translate([20, 50, 0]) cube(150);
				}else{
					translate([-150, 0, 0]) cube(150);
				}
			}
		}
	}
}

//---- pyramide inversée
module pyramide(whaut, wbas, piz){
	difference(){
		//
		piw1 = whaut-oe*2-pir*2;	// Largeur haute moins la matière moins le rayon minkowski
		piw2 = wbas-oe*2-pir*2;		// Largeur bas moins la matière moins le rayon minkowski
		//
		diago1 = sqrt(pow(piw1,2)+pow(piw1,2)); // diagonale/2 = rayon1
		diago2 = sqrt(pow(piw2,2)+pow(piw2,2)); // diagonale/2 = rayon2
		//
		minkowski(){
			//translate([oe+piw1/2+pir, oe+piw1/2+pir, 0]) 
			rotate([0,0,45]) cylinder(r1=diago2/2, r2=diago1/2, h=piz, $fn=4);
			cylinder(r=pir+oe,h=1);
		}
		minkowski(){
			//translate([oe+piw1/2+pir, oe+piw1/2+pir, 0]) 
			rotate([0,0,45]) cylinder(r1=diago2/2, r2=diago1/2, h=piz, $fn=4);
			cylinder(r=pir,h=1);
		}
	}
}

//---- panneau solaire
pox = 131; // panneau solaire 130*150
poz = 151; 
pob = 6; // bord panneau
porr = 14; // rayon coins panneau

module panosol(){
	difference(){
		translate([-chw/2, 0, 0]) rotate([0,90,0]) cylinder(r=chr, h=chw);
		// vis axe de charnière
		translate([-chw/2-1, 0, 0]) rotate([0,90,0]) cylinder(r=1.7, h=chw+2);
	}
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
