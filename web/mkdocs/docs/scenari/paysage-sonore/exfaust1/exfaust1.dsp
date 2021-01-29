
import("stdfaust.lib");
gate = checkbox ("[2]ON / OFF");
gain = vslider("Volume", 0.8, 0, 1, 0.001) : si.smoo;
freq = ba.midikey2hz (vslider ("[1]Freq_Note (LA, SIb, SI, DO)", 23, 23, 26, 1)); 
wah = vslider ("Wah[acc: 0 3 -10 0 10]", 0.5, 0, 1, 0.001) : si.smoo;
timbre(freq) = (os.osc (freq) + 0.5 *os.osc (2*freq) + 0.25 * os.triangle(3*freq));
process = hgroup ("Digeridoo", (timbre(freq) : ve.crybaby(wah)) * gain) *gate;

