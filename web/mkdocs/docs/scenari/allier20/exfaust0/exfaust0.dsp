
import("stdfaust.lib");
gate = button("gate[switch:1]");
freqm = hslider("freqm[acc: 1 0 -10 0 10]",500,100,2000,1);
modem = hslider("modem[knob:2]",1,0,4,1);
tempo = 480;
envtrig = ba.beat(tempo) * gate;
del = hslider("del[acc: 0 1 -10 0 10]",0,0,0.1,0.01) : si.smoo;
//fb = hslider("fb[knob:3]",0.5,0,0.8,0.01) : si.smoo;
process = pm.strike(1,0.8,1,envtrig) : 
pm.marimbaModel(freqm,modem) : 
ef.echo(0.4,del,0.8);

