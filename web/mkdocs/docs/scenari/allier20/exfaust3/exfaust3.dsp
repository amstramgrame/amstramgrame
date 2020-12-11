
import("stdfaust.lib");

gate = button("gate[switch:1]") : si.smoo;
freqOsc = hslider("freqOsc[knob:2]",196,98,784,0.01) : si.smoo;
posPied = hslider("posPied[acc: 0 0 -10 0 10 ]",0.5,0,1,0.01) : si.smoo;

process = os.lf_saw(freqOsc) * gate : ve.crybaby(posPied);

