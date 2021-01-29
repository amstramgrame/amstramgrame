
import("stdfaust.lib");
subSynth (ctfreq1) = no.pink_noise : fi.lowpass(1, ctfreq1); 
gain = hslider("v: [1]VAGUES/[1]volume",1,0,1,0.001) : si.smoo;
ctfreq1 = hslider("v: [1]VAGUES/[2]cutoff",2000,100,15000,0.001) : si.smoo;
rel = hslider ("v: [1]VAGUES/[3]longueur_vague", 3.5, 2.0, 5.0, 0.001) : si.smoo; 
envelope = en.adsr(0.1,0.01,0.9,rel,gate1)*gain;
shake_x = hslider("X rotation [acc: 0 1 -10 0 10]", 0, -100, 100, 0.001);
declenche = _ : abs > 75;
gate1 = shake_x : declenche;
echo = +~ (@(delLenght-1) : *(feedback))
with {
     duration = 0.6; 
     feedback = hslider ("v: [1]vagues/feedback", 0.35, 0, 0.85, 0.01);
     delLenght = ma.SR * duration; 
};
subSynth2 = no.noise : fi.lowpass (1, ctfreq2);
ctfreq2 = hslider("v: [0]MER/[0]fréq cutoff", 1200,100,7000,0.01) : si.smoo;
gain2 = hslider("v: [0]MER/[1]volume",0.08,0,0.5,0.001) : si.smoo;
process =  (subSynth2 * gain2)/2, (subSynth(ctfreq1) * envelope : echo)/2;    

