
import("stdfaust.lib");
impFreq = hslider("impFreq",11,2,20,0.01) : si.smoo;
process = os.lf_imptrain(impFreq);

