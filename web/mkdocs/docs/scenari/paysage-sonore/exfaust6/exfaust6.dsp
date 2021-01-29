
import("stdfaust.lib");
random (n,m) = (1 + no.noise)/2 * (m-n) + n : int; 
gain = hslider ("v:crépitements/volume", 1, 0.1, 1, 0.01);
gate = checkbox ("gate[switch:1]");
echo = +~ (@(delLenght-1) : *(feedback))
with {
     duration = 400 * 0.001;
     feedback = 0.15;
     delLenght = ma.SR * duration;
};
crepit = ba.beat (random (370, 380)) : echo;
feu = os.osc (freqnoise* no.pink_noise);
freqnoise = hslider ("v:feu/freq[knob:2]", 400, 20, 680, 1) : si.smoo;
process = (feu * gate/3), (crepit * 2 * gain * gate);

