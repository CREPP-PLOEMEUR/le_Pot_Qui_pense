
// include <Hexa.scad>;

m3h = 2.4; 		// hauteur
m3k = 5.5; 		// plat a plat
m3e = 6.3; 		// pointe a pointe
m3r = m3e/2; 	// rayon pointe a pointe
m3p = 0.5; 		// pas

m4h = 3.2;
m4k = 7;
m4e = 8.08;
m4r = m4e/2;
m4p = 0.7;

m5h = 4.7;
m5k = 8;
m5e = 9.23;
m5r = m5e/2;
m5p = 0.8;

m6h = 5.2;
m6k = 10;
m6e = 11.54;
m6r = m6e/2;
m6p = 1.0;

m8h = 6.8;
m8k = 13;
m8e = 15.01;
m8r = m8e/2;
m8p = 1.25;

m10h = 8.4;
m10k = 17;
m10e = 19.62;
m10r = m10e/2;
m10p = 1.5;

m12h = 10.8;
m12k = 19;
m12e = 21.93;
m12r = m12e/2;
m12p = 1.75;

coef = 2/sqrt(3);
echo(coef);

module m3(jk=0, jh=0, jvis=0){
    d = m3k * coef;
    cylinder(r=d/2+jk, h=m3h+jh, $fn=6);
    if(jvis != 0){
        translate([0,0,-30]) cylinder(r=3/2+jvis, h=60, $fn=12);
    }
}