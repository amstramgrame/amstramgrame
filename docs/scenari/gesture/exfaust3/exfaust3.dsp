
import("stdfaust.lib");

freq = hslider("freq[acc: 0 0 -10 0 10]",200,100,2000,0.01) : si.smoo;
gain = hslider("gain[acc: 1 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;
gate = checkbox("gate[switch:1]") : si.smoo;

process = os.osc(freq)*gain*gate;

