
import("stdfaust.lib");

// parameters
gate = button("gate[switch:1]");
pressure = hslider("pressure[acc: 0 1 -10 0 10]",0.5,0,1,0.01);
reed = hslider("reed[knob:3]",0.5,0,1,0.01) : si.smooth(0.99);
bell = hslider("bell[acc: 2 0 -10 0 10]",0.5,0,1,0.01) : si.smooth(0.99);
tube = hslider("note[knob:2]",60,40,70,3) : ba.midikey2hz : pm.f2l : si.smooth(0.99);

// additional mappings
pres = gate*pressure : si.smooth(0.99);

process = pm.clarinetModel(tube,pres,reed,bell); 

