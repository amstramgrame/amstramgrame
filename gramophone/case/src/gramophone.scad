// Gramophone v. 3
// Romain Michon, GRAME-CNCM, Lyon

include <baseMain.scad>
include <baseBottom.scad>
include <baseTop.scad>
include <amLogo.scad>

$fn=100;

depth = 70;
diameter = 80;
wallsThickness = 3;

bandWidth = 25;
bandHoleThickness = 2;

speakerScrewHoleDiameter = 2;
speakerLipThickness = 13;

module top()
{
    translate([-26,-29,-2]) scale([13,16,1]) amLogo(2);
    difference(){
        translate([0,0,-11]) rotate([180,0,0]) baseTop();
        translate([0,0,-10]) cylinder(10,d=54);
        
        // mount screw holes top
        rotate([0,0,0]) translate([diameter/2-5,0,-7.5]) rotate([0,90,0]) cylinder(d=2.5,h=10);
        rotate([0,0,90]) translate([diameter/2-5,0,-7.5]) rotate([0,90,0]) cylinder(d=2.5,h=10);
        rotate([0,0,180]) translate([diameter/2-5,0,-7.5]) rotate([0,90,0]) cylinder(d=2.5,h=10);
        rotate([0,0,270]) translate([diameter/2-5,0,-7.5]) rotate([0,90,0]) cylinder(d=2.5,h=10);
    }
}
   
// main
module main(){
    difference(){
        union(){
            baseMain();
            // circuit holders
            difference(){
                rotate([0,0,-42]) translate([31.5,0,-50]) cylinder(d=5,h=5);
                rotate([0,0,-42]) translate([31.5,0,-50]) cylinder(d=1,h=5);
            }
            difference(){
                rotate([0,0,90]) translate([31.5,0,-50]) cylinder(d=5,h=5);
                rotate([0,0,90]) translate([31.5,0,-50]) cylinder(d=1,h=5);
            }
            rotate([0,0,90]) translate([diameter/2-0.5,0,-36]) rotate([0,90,0]) rotate_extrude() translate([6,0,0]) circle(2);
        }
    
        // Speaker holes
        translate([21,21,-speakerLipThickness]) cylinder(speakerLipThickness,d=speakerScrewHoleDiameter);
        translate([21,-21,-speakerLipThickness]) cylinder(speakerLipThickness,d=speakerScrewHoleDiameter);
        translate([-21,-21,-speakerLipThickness]) cylinder(speakerLipThickness,d=speakerScrewHoleDiameter);
        translate([-21,21,-speakerLipThickness]) cylinder(speakerLipThickness,d=speakerScrewHoleDiameter);
    
        // mount screws holes
        rotate([0,0,135]) translate([diameter/2-10,0,-61.5]) rotate([0,90,0]) cylinder(d=1,h=10);
        rotate([0,0,-45]) translate([diameter/2-10,0,-61.5]) rotate([0,90,0]) cylinder(d=1,h=10);
        rotate([0,0,45]) translate([diameter/2-10,0,-61.5]) rotate([0,90,0]) cylinder(d=1,h=10);
        rotate([0,0,225]) translate([diameter/2-10,0,-61.5]) rotate([0,90,0]) cylinder(d=1,h=10);
        
        // mount screw holes top
        rotate([0,0,0]) translate([diameter/2-3-10,0,-2.5]) rotate([0,90,0]) cylinder(d=1,h=10);
        rotate([0,0,90]) translate([diameter/2-3-10,0,-2.5]) rotate([0,90,0]) cylinder(d=1,h=10);
        rotate([0,0,180]) translate([diameter/2-3-10,0,-2.5]) rotate([0,90,0]) cylinder(d=1,h=10);
        rotate([0,0,270]) translate([diameter/2-3-10,0,-2.5]) rotate([0,90,0]) cylinder(d=1,h=10);
    
        // top notch
        translate([0,diameter/2-1.5,-61.5]) cube([2,1,5],center=true);
    
        // jack hole
        translate([diameter/2-5,0,-47.75]) rotate([0,90,0]) cylinder(d=8,h=5);
    
        // mic hole
        rotate([0,0,-16]) translate([diameter/2-5,0,-50.5]) rotate([0,90,0]) cylinder(d=7,h=5);
    
        // USB hole
        rotate([0,0,76]) translate([diameter/2-2.5,-1,-49]) cube([5,14,7],center=true);
    
        // volume hole
        rotate([0,0,25]) translate([diameter/2-10,0,-27]) rotate([0,90,0]) cylinder(d=7,h=10);
    
        // encoder hole
        rotate([0,0,-15]) translate([diameter/2-10,0,-27]) rotate([0,90,0]) cylinder(d=7,h=10);
        
        // pot hole
        rotate([0,0,135]) translate([diameter/2-10,0,-27]) rotate([0,90,0]) cylinder(d=7,h=10);
    
        // Power button hole
        rotate([0,0,-50]) translate([diameter/2-10,0,-27]) rotate([0,90,0]) cylinder(d=16,h=10);
    
        // Battery LED
        //rotate([0,0,55]) translate([diameter/2-10,0,-27]) rotate([0,90,0]) cylinder(d=5,h=10);
        //rotate([0,0,55]) translate([diameter/2-13,0,-27]) rotate([0,90,0]) cylinder(d=6,h=10);
        
        // Assignable button
        rotate([0,0,180]) translate([diameter/2-14,0,-36]) rotate([0,90,0]) cylinder(d=16,h=14);
        
        // Rim Hole
        rotate([0,0,25]) translate([0,0,-45]) difference(){
            cylinder(d=diameter-wallsThickness*2,h=10);
            translate([5,-(diameter-wallsThickness*2)/2,0]) cube([diameter-wallsThickness*2,diameter-wallsThickness*2,10]);
        }
        rotate([0,0,205]) translate([0,0,-45]) difference(){
            cylinder(d=diameter-wallsThickness*2,h=10);
            translate([-19,-(diameter-wallsThickness*2)/2,0]) cube([diameter-wallsThickness*2,diameter-wallsThickness*2,10]);
        }
        
        // Photores 2
        rotate([0,0,90]) translate([diameter/2-10,0,-36]) rotate([0,90,0]) cylinder(d=5,h=10);  
    }
}

module bottom(){
    difference(){
        union(){
            translate([0,0,-59]) baseBottom();
            translate([0,diameter/2-1.5,-61.5]) cube([2,1,5],center=true);
        }
        
        // mount screws holes
        rotate([0,0,135]) translate([diameter/2-10,0,-61.5]) rotate([0,90,0]) cylinder(d=2.5,h=10);
        rotate([0,0,-45]) translate([diameter/2-10,0,-61.5]) rotate([0,90,0]) cylinder(d=2.5,h=10);
        rotate([0,0,45]) translate([diameter/2-10,0,-61.5]) rotate([0,90,0]) cylinder(d=2.5,h=10);
        rotate([0,0,225]) translate([diameter/2-10,0,-61.5]) rotate([0,90,0]) cylinder(d=2.5,h=10);
        
        // hand band
        rotate([0,0,90]){
            translate([diameter/2-20,-bandWidth,-(depth-wallsThickness)]) cube([20,bandWidth,bandHoleThickness]);
            translate([-(diameter/2),-bandWidth,-(depth-wallsThickness)]) cube([20,bandWidth,bandHoleThickness]);
        }
    }
}

translate([0,0,5]) top();
main();
bottom();
