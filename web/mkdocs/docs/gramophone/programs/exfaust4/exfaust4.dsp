
declare name            "Lightning in the dark";
declare version         "1.0";
declare author          "Johann Philippe";
declare license         "MIT";
declare copyright       "(c) Johann Philippe 2022";

/*
    A recursive short delay based iterator (produces shiny and rich sounds)
*/

import("stdfaust.lib");

on_click(x) = (x > x');

trig = button("trig[switch:1]");
speed = hslider("speed[knob:2]", 60, 30, 500, 1);
div = hslider("div[acc: 1 0 -10 0 10]", 10, 1, 100,0.1);
ffq = hslider("filter_fq[acc: 0 0 -10 0 10]", 0.5, 0, 0.99, 0.01);
amp = hslider("amp", 0.5, 0, 1, 0.01) : si.smoo;

imp = on_click(trig);
env = imp : en.adsre(0, 0.05, 0.8, 0.05);
recdel(max_smps, smps, fb) = +~de.delay(max_smps,smps) * fb;

kick(pitch, click, attack, decay, drive, gate) = out
with {
    env = en.adsr(attack, decay, 0.0, 0.1, gate);
    pitchenv = en.adsr(0.005, click, 0.0, 0.1, gate);
    clean = env * os.osc((1 + pitchenv * 4) * pitch);
    out = ma.tanh(clean * drive);
};

mpulse(smps_dur, trig) = pulsation
with {
    count = ba.countdown(smps_dur, trig);
    pulsation = 0, 1 : select2(count > 0);
};
mpulse_dur(duration, trig) = mpulse(ba.sec2samp(duration), trig);
kik = ba.beat(speed) 
    : mpulse(abs(no.noise) * (speed / div) ) 
    : *(no.noise);

MAX_DLY = 6000;
MIN_DLY = 500;
dly_mult = MIN_DLY ; 
sig = sum(n, 4, kik : recdel(MAX_DLY, dly_mult / (n + 1) , 0.99) 
    : recdel(MAX_DLY * 2, dly_mult / (n + 1) * 2, 0.9))  
    : ve.oberheimHPF(ffq, 1) 
    : fi.dcblocker; 
process = sig * amp;

