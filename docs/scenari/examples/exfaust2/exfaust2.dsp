
import("stdfaust.lib");
impFreq = hslider("impFreq",11,2,20,0.01) : si.smoo;
resFreq = hslider("resFreq",1650,300,3000,0.01) : si.smoo;
q = hslider("q[knob:3]",30,10,50,0.01) : si.smoo;
process = os.lf_imptrain(impFreq) : fi.resonlp(resFreq,q,1);

