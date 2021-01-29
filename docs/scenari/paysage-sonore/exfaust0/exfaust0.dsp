
import("stdfaust.lib"); 
gain = hslider ("[2]volume", 0.5, 0.0, 1.0, 0.001);
wah = hslider ("[1]wah[acc: 0 2 -10 0 10]", 0.5, 0, 1, 0.01);
gate = button("gate[switch:1]");
freq = ba.midikey2hz (hslider ("[0]freq[knob:2]", 23, 23, 26, 1)); 
timbre(freq) = (os.osc (freq) + 0.5 *os.square(2*freq) + 0.25*os.triangle (3*freq))/3;
process = (timbre(freq) : ve.crybaby(wah)) * gain *gate; 

