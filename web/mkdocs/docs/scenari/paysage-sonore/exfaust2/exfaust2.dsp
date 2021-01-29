
import("stdfaust.lib");
subSynth (ctFreq) = no.pink_noise : fi.lowpass(1, ctfreq1);
ctfreq1 = hslider("cutoff_freq vagues[knob:2]",5500,30,15000,0.01) : si.smoo;
gain = hslider("volume[knob:1]",1,0,1,0.01);
shake_x = hslider("X rotation[acc: 0 1 -10 0 10]", 0, -100, 100, 0.01);
declenche = _ : abs > 75;
gate = shake_x : declenche;
envelope = en.adsr(0.1,0.01,0.9,5,gate)*gain;
subSynth2 = no.noise : fi.lowpass (1, 1700);
process = subSynth2 * 0.04 + (subSynth(ctfreq1) * envelope) <:_,_;

