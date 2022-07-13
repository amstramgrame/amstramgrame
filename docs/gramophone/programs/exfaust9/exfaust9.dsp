
declare name            "Wah Synthesizer";
declare version         "1.0";
declare author          "Johann Philippe";
declare license         "MIT";
declare copyright       "(c) Johann Philippe 2022";

import("stdfaust.lib");

on_click(x) = 0, 1 : select2( x > x');

/*
    Impulsion with a specified duration. Can be retriggered.
*/
mpulse(smps_dur, trig) = pulsation
with {
    count = ba.countdown(smps_dur, trig);
    pulsation = 0, 1 : select2(count > 0);
};
mpulse_dur(duration, trig) = mpulse(ba.sec2samp(duration), trig);

trig = button("trig[switch:1]");
noise_amount = hslider("noise[acc: 0 0 -10 0 10]", 0, 0, 300, 1);
freq = hslider("freq[acc: 1 0 -10 0 10]", 80, 70, 250, 1) 
    : +(nz) 
    : ba.sAndH( on_click(trig) + os.impulse);
amp = hslider("amp", 0.8, 0, 1, 0.01) : si.smoo;
MAX_ECHO = 0.5;
echo_dur = hslider("dur[acc: 2 0 -10 0 10]", 0.1, 0.1, MAX_ECHO, 0.01) 
    : ba.sAndH(on_click(trig) + os.impulse);

nz = no.noise 
    : abs 
    : *(noise_amount);
sig_gen(n) = os.sawtooth(freq * n); 

N_OSC = 4;
sig = sum(n, N_OSC, sig_gen(n + 1)) / N_OSC;
ATQ = 0.05;
env = trig 
    : mpulse_dur(ATQ) 
    : en.adsre(ATQ, 0.1, 0.3, 0.4);


echo(mix, sig) = sig : ef.echo(2, echo_dur, 0.55) 
    : _*mix + (1-mix) * sig; 

process = sig * env 
    : ve.crybaby(env) 
    : ef.echo(MAX_ECHO, echo_dur, 0.55) : *(amp);
