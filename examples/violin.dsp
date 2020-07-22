import("stdfaust.lib");

gate = checkbox("gate[switch:1]");

stringLength = hslider("stringLength[knob:2]",1.5,0.5,3,0.01);

bowVelocity = hslider("p[acc: 0 1 -10 0 10]",0.1,0,1,0.01)*gate;
bowPressure = hslider("lips[gyr: 0 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;
bowPosition = hslider("dist[acc: 1 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;

process = pm.violinModel(stringLength,bowPressure,bowVelocity,bowPosition); 
