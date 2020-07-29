
import("stdfaust.lib");

// parameters
impFreq = hslider("impFreq[acc: 1 0 -10 0 10]",11,2,20,0.01) : si.smoo;
resFreq = hslider("resFreq[acc: 0 1 -10 0 10]",1650,300,3000,0.01) : si.smoo;
distDrive = hslider("distDrive[knob:2]",0,0,1,0.01) : si.smoo;
q = hslider("q[knob:3]",30,10,50,0.01) : si.smoo;
del = hslider("del[acc: 0 1 -10 0 10]",0.2,0,0.4,0.01) : si.smoo;
fb = hslider("fb[acc: 1 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;
gate = button("gate[switch:1]");

// DSP
process = os.lf_imptrain(impFreq)*gate  : fi.resonlp(resFreq,q,1) : 
ef.echo(0.4,del,fb) : ef.cubicnl(distDrive,0)*0.95;

