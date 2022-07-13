
declare name            "Sun";
declare version         "1.0";
declare author          "Johann Philippe";
declare license         "MIT";
declare copyright       "(c) Johann Philippe 2022";

/*
    Shiny as the sun, modulated sawtooth with a big echo
*/

import("stdfaust.lib");

mpulse(smps_dur, trig) = pulsation
with {
    count = ba.countdown( smps_dur, trig);
    pulsation = 0, 1 : select2(count > 0);
};
mpulse_dur(duration, trig) = mpulse(ba.sec2samp(duration), trig);

on_click(x) = (x > x');

// Controls
btn =  button("trig[switch:1]");
freq = hslider("freq[acc: 0 0 -10 0 10]", 100, 50, 400, 1) 
    : ba.sAndH(on_click(btn) + initial);
lf_freq = hslider("lf_freq[acc: 1 0 -10 0 10]", 1, 0.1, 5, 0.1);
amp = hslider("amp", 0.1, 0, 1, 0.01) 
    : si.smoo;

// DSP
initial = os.impulse;
N_OSC = 4;
lfo(n) = os.lf_squarewave(lf_freq * n);
saw_gen(n) = os.sawtooth(freq * n ) : /(n * 0.5) : *(lfo(n));
env = btn : mpulse_dur(0.05) : en.are(0.05, 8);
echo(sig) = sig : ef.echo(1, 0.1, 0.95) : _*0.3 + sig * 0.7; 
synt = sum(n, N_OSC, saw_gen(n + 1)) 
    : pf.flanger_mono(10, abs(lfo(1)) * 2 + 5, 0.9, 0.9, 0) 
    : *(env) 
    : echo;

process = synt * amp;

