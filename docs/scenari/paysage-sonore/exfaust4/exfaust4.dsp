
import ("stdfaust.lib");
gain = hslider ("Volume", 0.8, 0, 1, 0.001) : si.smoo;
gate = checkbox ("On / Off[switch:1]");
basse = ba.beat (bpm_basse) : pm.djembe(75, 0.2, 0.3, 1);
tone = ba.beat (bpm_tone) : pm.djembe(300, 0.7, 0.3, 0.7);
slap = ba.beat (bpm_slap) : pm.djembe(550, 0.9, 0.3, 0.4);
s = hslider ("Sel[knob:2]", 0, 0, 2, 1); 
bpm_basse = 60; 
bpm_tone = hslider ("Bpm_tone[acc: 0 0 -10 0 10]", 120, 60, 240, 1) : si.smoo; 
bpm_slap = hslider ("Bpm_slap[acc: 0 0 -10 0 10]", 60, 30, 120, 1) : si.smoo; 
process = (basse, basse + tone, basse + tone + slap) : select3 (s) * gate;

