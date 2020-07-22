import("stdfaust.lib");

gate = button("gate[switch:1]");
gain = hslider("gain[acc: 0 1 -10 0 10]",0.5,0,1,0.01)^2;
del = hslider("del[acc: 1 0 -10 0 10]",525,50,1000,1) : si.smoo;
fb = hslider("fb[knob:2]",0.7,0.5,1,0.001);

process = no.noise*gate*gain : fi.fb_fcomb(1024,del,1,fb); 
