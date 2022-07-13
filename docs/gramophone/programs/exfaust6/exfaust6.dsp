
declare name            "Particles in space";
declare version         "1.0";
declare author          "Johann Philippe";
declare license         "MIT";
declare copyright       "(c) Johann Philippe 2022";

/*
    Euclidian space particles based on filtered and echoed sawtooth
*/

import("stdfaust.lib");

mpulse(smps_dur, trig) = pulsation
with {
    count = ba.countdown(smps_dur, trig);
    pulsation = 0, 1 : select2(count > 0);
};
mpulse_dur(duration, trig) = mpulse(ba.sec2samp(duration), trig);

euclidian(onset, div, pulses, rotation, phasor) = (cond & trig)
with {
    kph = int( ((phasor * div) % 1) * pulses);
    eucval = int((onset / pulses) * kph);
    cond = 0, 1 : select2(eucval' != eucval);
    trig = 0, 1 : select2(kph' != kph);
};

// Controls
sw = button("trigger[switch:1]") : ba.toggle;
metro_speed = hslider("metro[acc: 1 0 -10 0 10]", 50,  1, 300, 0.1);
add = hslider("freq_add[acc: 0 0 -10 0 10]", 100, 50, 2500, 1);
mult = hslider("freq_mult[knob:3]", 500, 250, 2500, 1);
q = hslider("Q", 0.5, 0.1, 9.9, 0.01);
gain = hslider("gain", 2, 0.0, 10, 0.01);

// DSP
origin_pulse = os.impulse;
metro_freq = metro_speed / 60;
smetro = ba.beat(metro_speed) : *(sw);  
metro = euclidian( 
    abs(no.noise) + 1 * 1.55 : ba.sAndH(smetro | origin_pulse)
    , 2.654
    , 64
    , 0
    , os.phasor(1, metro_freq)) 
    : *(sw);

rand = (abs(no.noise) * mult  + add ) 
    : ba.sAndH(metro | origin_pulse);
ATQ_DUR = 0.001;
f_env = metro 
    : mpulse_dur(ATQ_DUR)  
    : en.are(ATQ_DUR, 0.5) + 0.01;
echo_mix(mix, sig) = sig 
    : ef.echo(0.1, 0.1, 0.8) 
    : _ * mix +  sig * (1 - mix);
env = metro : mpulse_dur(ATQ_DUR) : en.are(ATQ_DUR, 1);

// Le filtre peut être changé pour obtenir des résultats très intéressants
// aussi. Les filtres suivants sont intérressants :
//os.sawtooth(rand) : fi.resonlp(f_env * 5000, q, 0.5); 
//os.sawtooth(rand) :  ve.diodeLadder(f_env * 0.85, q);
//os.sawtooth(rand) : ve.korg35LPF(f_env / 2, q);

process = os.sawtooth(rand) : ve.korg35LPF(f_env / 2, q) : echo_mix(0.7) : _ * gain *env;

