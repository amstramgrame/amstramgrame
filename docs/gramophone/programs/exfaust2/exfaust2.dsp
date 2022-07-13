
declare name            "Whale";
declare version         "1.0";
declare author          "Johann Philippe";
declare license         "MIT";
declare copyright       "(c) Johann Philippe 2022";

/*
    A simple gliding filtered sawtooth synthesizer with different echoes
*/

import("stdfaust.lib");

line(time, sig) = res
letrec {
	'changed = (sig' != sig) | (time' != time);
	'steps = ma.SR * time;
	'cntup = ba.countup(steps ,changed);  
	'diff = ( sig - res);
	'inc = diff / steps 
        : ba.sAndH(changed);
	'res = res, res + inc 
        : select2(cntup <  steps);
};

mpulse(smps_dur, trig) = pulsation
with {
    count = ba.countdown(smps_dur, trig);
    pulsation = 0, 1 
        : select2(count > 0);
};
mpulse_dur(duration, trig) = mpulse(ba.sec2samp(duration), trig);

// Controls
freq = hslider("freq[acc: 1 0 -10 0 10]", 1000, 400, 2000, 1) 
    : si.smoo;
rel = hslider("release[acc: 0 0 -10 0 10]", 0.5, 0.5, 3, 0.01);
trig = button("trig[switch:1]");
amp = hslider("amp", 0.05, 0, 1, 0.01) 
    : si.smoo;

ATQ = 0.5;
env = trig 
    : mpulse_dur(ATQ) 
    : en.are(ATQ, rel);

synt = os.sawtooth(freq) 
    : fi.resonbp(freq, 10, 0.5) 
    : fi.fbcombfilter(64, 32, 0.5) 
    : fi.bandstop(2, 1100, 1600)  *(env); 

echoed = synt 
    : ef.echo(1, 0.12, 0.75);

process = (synt + echoed * 0.6) * amp;

