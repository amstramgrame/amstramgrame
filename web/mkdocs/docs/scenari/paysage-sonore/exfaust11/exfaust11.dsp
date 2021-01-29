
import("stdfaust.lib");
random (n,m) = (1 + no.noise)/2 * (m-n) + n : int; 
gain = hslider ("[1]VOLUME CRÉPIT", 0.6, 0.1, 1, 0.01);
gate = hslider ("[0]ON / OFF", 0, 0, 1, 1);
echo = +~ (@(delLenght-1) : *(feedback))
with {
     duration = 400 * 0.001;
     feedback = 0.15;
     delLenght = ma.SR * duration;
};
crepit = ba.beat (random (370, 380)) : echo;
feu = os.osc (freqosc* no.pink_noise);
freqosc = hslider ("[3]INTENSITÉ FLAMME", 650, 200, 900, 1) : si.smoo;
ctfreq = hslider ("[4]CUT OFF FREQ FEU", 500, 40, 700, 1) : si.smoo;
gain2 = hslider ("[2]VOLUME FEU", 1, 0.1, 1, 0.01) : si.smoo;
process = (feu * gate * gain2 : fi.lowpass (1, ctfreq)), (crepit * gain* gate);

