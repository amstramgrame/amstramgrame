
declare name            "Uranus";
declare version         "1.0";
declare author          "Johann Philippe";
declare license         "MIT";
declare copyright       "(c) Johann Philippe 2022";

/*
    Gravitational additive synthesis.
*/

import("stdfaust.lib");

// Controls
btn =  button("trig[switch:1]");
freq = hslider("freq[knob:2]", 80, 50, 150, 1);
speed_mult = hslider("lf_freq[acc: 0 0 -10 0 10]", 1, 0.1, 5, 0.1);
amp = hslider("amp", 0.8, 0, 1, 0.01) : si.smoo;

// DSP
tog = btn : ba.toggle;
tog_amp = tog : line(0.1);
w1 = waveform{0.5, 1, 3, 8, 16};
amp1 = waveform{0.1, 0.2, 0.1, 0.05, 0.003};
N_OSC = 5;

a1(n) = amp1, n : rdtable;
s1(n) = w1, n : rdtable : *(freq) : os.osc : *(a1(n));

generic(base_fq, n) = w1, n : rdtable : *(base_fq) : os.osc : *(a1(n));

synt = sum(n, N_OSC, generic(freq, n)) 
    + sum(n, N_OSC, generic(freq * 1.001, n))
    + sum(n, N_OSC, generic(freq * 1.01, n))
    + sum(n, N_OSC, generic(freq * 1.00001, n))
    : fi.highpass(4, 150)
    ;

ATQ = 0.01;
REL = 1;
remove_neg(x) = x, 0 : select2(x < 0);
env = os.lf_squarewave(speed_mult) : remove_neg 
    : si.smoo;
iter = (sum(n, N_OSC, generic(freq * 6,  n)) * env * 0.1 )  
    : ef.echo(0.1, 0.1, 0.75) ;
sommation = (synt * 0.5) + iter 
    : *(2);

process = sommation *  amp * tog ; 

