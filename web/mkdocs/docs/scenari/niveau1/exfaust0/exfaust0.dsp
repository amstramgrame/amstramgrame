
import("stdfaust.lib");
freq = hslider("freq",440,50,3000,0.01);
gain = hslider("gain",1,0,1,0.01);
gate = button("gate");
process = os.sawtooth(freq);

