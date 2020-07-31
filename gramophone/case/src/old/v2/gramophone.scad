// Gramophone v. 2
// Romain Michon, GRAME-CNCM, Lyon

include <baseMain.scad>
include <baseTop.scad>

$fn=100;

depth = 75;
diameter = 86;
wallsThickness = 2;

bandWidth = 25;
bandHoleThickness = 2;

speakerScrewHoleDiameter = 2;
speakerLipThickness = 9;

module top()
{
    difference(){
        translate([0,0,-11]) rotate([180,0,0]) baseTop();
        translate([0,0,-10]) cylinder(10,d=54);
    }
    translate([-(diameter-14)/2,-1,-2]) cube([diameter-14,2,2]);
    translate([-(diameter-16)/2,-9,-2]) cube([diameter-16,2,2]);
    translate([-(diameter-22)/2,-17,-2]) cube([diameter-22,2,2]);
    translate([-(diameter-34)/2,-25,-2]) cube([diameter-34,2,2]);
    translate([-(diameter-16)/2,7,-2]) cube([diameter-16,2,2]);
    translate([-(diameter-22)/2,15,-2]) cube([diameter-22,2,2]);
    translate([-(diameter-34)/2,23,-2]) cube([diameter-34,2,2]);
    rotate([0,0,90]){
        translate([-(diameter-14)/2,-1,-2]) cube([diameter-14,2,2]);
        translate([-(diameter-16)/2,-9,-2]) cube([diameter-16,2,2]);
        translate([-(diameter-22)/2,-17,-2]) cube([diameter-22,2,2]);
        translate([-(diameter-34)/2,-25,-2]) cube([diameter-34,2,2]);
        translate([-(diameter-16)/2,7,-2]) cube([diameter-16,2,2]);
        translate([-(diameter-22)/2,15,-2]) cube([diameter-22,2,2]);
        translate([-(diameter-34)/2,23,-2]) cube([diameter-34,2,2]);
    }
}

// main
difference(){
    union(){
        baseMain();
        translate([0,-3,-depth]) difference(){
            cylinder(32+wallsThickness,d=7);
            cylinder(32+wallsThickness,d=speakerScrewHoleDiameter);
        }
        translate([-15,diameter/2-7,-depth+32.5+wallsThickness+3]) cube([30,4,wallsThickness]);
        translate([-15,diameter/2-7,-depth+32.5]) cube([30,4,wallsThickness]);
    }
    translate([diameter/2-20,-bandWidth,-(depth-wallsThickness)]) cube([20,bandWidth,bandHoleThickness]);
    translate([-(diameter/2),-bandWidth,-(depth-wallsThickness)]) cube([20,bandWidth,bandHoleThickness]);
    translate([21,21,-speakerLipThickness]) cylinder(speakerLipThickness,d=speakerScrewHoleDiameter);
    translate([21,-21,-speakerLipThickness]) cylinder(speakerLipThickness,d=speakerScrewHoleDiameter);
    translate([-21,-21,-speakerLipThickness]) cylinder(speakerLipThickness,d=speakerScrewHoleDiameter);
    translate([-21,21,-speakerLipThickness]) cylinder(speakerLipThickness,d=speakerScrewHoleDiameter);
    translate([-5,-(diameter/2),-(depth-wallsThickness-18)]) cube([12,20,6]);
    translate([-5.5,-(diameter/2),-(depth-wallsThickness-5)]) cube([13,20,9]);
    translate([0,-diameter/2+20,-depth/2+3]) rotate([90,0,0]) cylinder(20,d=7);
    rotate([0,0,-45]) translate([-6,-(diameter/2),-(depth-wallsThickness-13)]) cube([12.5,20,12.5]);
    rotate([0,0,90]) translate([0,-diameter/2+20,-depth/2+6]) rotate([90,0,0]) cylinder(20,d=5);
    
    translate([0,diameter/2+1.5,-(depth-25)]) rotate([90,0,0]) cylinder(2,d=9);
    translate([-4.5,diameter/2-0.5,-(depth-25)]) cube([9,10,7]);
    translate([-4.5,diameter/2-3,-(depth-30)]) cube([9,10,2]);
    
    rotate([0,0,-90]) {translate([0,diameter/2+1.5,-(depth-25)]) rotate([90,0,0]) cylinder(2,d=9);
    translate([-4.5,diameter/2-0.5,-(depth-25)]) cube([9,10,7]);
    translate([-4.5,diameter/2-3,-(depth-30)]) cube([9,10,2]);}
}

// holder plate
translate([0,0,-depth+35.5]) difference(){
    translate([-13,-6.5,0]) cube([26,diameter/2+2,wallsThickness]);
    translate([0,-3,0]) cylinder(wallsThickness,d=3);
}

// top plate
translate([0,0,6]) top();
