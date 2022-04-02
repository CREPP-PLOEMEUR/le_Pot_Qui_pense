
//----- Charnière du panneau
chw = 70; // W: largeur de la charnière coté panneau
chr = 8; // rayon charnière
axr = 3; // rayon axe pivot de charnière
jj = 0.4; // jeux charnière 

molz = chr; // molette Z
m3e = 6.3; 		// pointe a pointe
m3r = m3e/2; 	// rayon pointe


module molette() difference(){
	union(){
		cylinder(r=chr, h=molz);
		translate([0,0,molz]) sphere(r=chr);
	}
	translate([0,0,-1]) cylinder(r=1.7, h=molz+chr+2, $fn=4*3);
	translate([0,0,5]) cylinder(r=m3r+0.2, h=molz+chr+2, $fn=6);
}

molette();
translate([25,0,0]) molette();