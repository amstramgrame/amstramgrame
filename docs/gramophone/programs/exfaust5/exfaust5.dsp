
declare name            "Strange Echo";
declare version         "1.0";
declare author          "Johann Philippe";
declare license         "MIT";
declare copyright       "(c) Johann Philippe 2022";

/*
    Kick based echo generator
*/

import("stdfaust.lib");

on_click(x) = (x > x');

MAX_DLY = 3000;
MIN_DLY = 1000;
// Controls
trig = button("trig[switch:1]");
dly_mult = hslider("mult[acc: 1 0 -10 0 10]", MIN_DLY, MIN_DLY, MAX_DLY, 1) 
    : ba.sAndH(os.impulse + imp);
amp = hslider("amp", 0.8, 0, 1, 0.01) : si.smoo;

imp = on_click(trig);
env = imp 
    : en.adsre(0, 0.05, 0.8, 0.05);

recdel(max_smps, smps, fb) = +~de.delay(max_smps,smps) * fb;

kick(pitch, click, attack, decay, drive, gate) = out
with {
    env = en.adsr(attack, decay, 0.0, 0.1, gate);
    pitchenv = en.adsr(0.005, click, 0.0, 0.1, gate);
    clean = env * os.osc((1 + pitchenv * 4) * pitch);
    out = ma.tanh(clean * drive);
};

kik = kick(20, 0.005, 0.005, 0.1, 10, trig);
sig = sum(n, 4, kik : recdel(MAX_DLY, dly_mult / (n + 1) , 0.99))  /4;

process = sig 
    : fi.dcblocker 
    : fi.highpass(4, 100) 
    : *(amp);

