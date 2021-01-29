
import("stdfaust.lib");
random (n,m) = (1 + no.noise)/2 * (m-n) + n : int; 
gain = hslider ("v:Crépitements/volume", 0.9, 0.1, 1, 0.01);
gate = checkbox ("ON / OFF");
echo = +~ (@(delLenght-1) : *(feedback))
with {
     duration = 400 * 0.001;
     feedback = 0.15;
     delLenght = ma.SR * duration;
};
crepit = ba.beat (random (370, 380)) : echo;
feu = os.osc (freqosc * no.pink_noise);
freqosc = hslider ("v:Feu/intensité flamme", 500, 200, 800, 1) : si.smoo;
ctfreq = hslider ("v:Feu/ctfreq", 300, 40, 700, 1) : si.smoo;
gain2 = hslider ("v:Feu/volume", 1, 0.1, 1, 0.01) : si.smoo;
process = (feu * gate * gain2) : fi.lowpass (1,ctfreq) /1.5, (crepit * gain* gate)/1.5;

