import("stdfaust.lib");

gate = checkbox("gate[switch:1]") : si.smoo;

freq0 = hslider("freq0[knob:2]",200,50,500,0.01) : si.smoo;
ratio1 = hslider("ratio1[acc: 0 1 -10 0 10]",1.5,1,2,0.01) : si.smoo;
ratio2 = hslider("ratio2[acc: 1 0 -10 0 10]",1.5,1,2,0.01) : si.smoo;
index1 = hslider("index1[acc: 1 1 -10 0 10]",500,0,1000,0.01) : si.smoo;
index2 = hslider("index2[knob:3]",500,0,1000,0.01) : si.smoo;

freq1 = freq0*ratio1;
freq2 = freq1*ratio2;

process = sy.fm((freq0,freq1,freq2),(index1,index2))*gate; 
