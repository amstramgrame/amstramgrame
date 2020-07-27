
import("stdfaust.lib");

// parameters
gate = checkbox("gate[switch:1]");
p = hslider("p[acc: 0 1 -10 0 10]",0.5,0,1,0.01) : si.smoo;
lips = hslider("lips[acc: 2 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;
tube = hslider("note[acc: 1 0 -10 0 10]",60,40,70,3) : ba.midikey2hz : pm.f2l;
dist = hslider("dist[knob:2]",0,0,1,0.01) : si.smoo;

// mappings
pres = gate*p;

process = pm.brassModel(tube,lips,0,pres) : ef.cubicnl(dist,0)*0.95; 

