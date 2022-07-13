
declare name            "Euclidian rain";
declare version         "1.0";
declare author          "Johann Philippe";
declare license         "MIT";
declare copyright       "(c) Johann Philippe 2022";

/*
    Rain with echo sounds based on karplus enveloppe,
    and triggered with euclidian rhythms.
*/

import("stdfaust.lib");

mpulse(smps_dur, trig) = pulsation
with {
    count = ba.countdown(smps_dur, trig);
    pulsation = 0, 1 : select2(count > 0);
};
mpulse_dur(duration, trig) = mpulse(ba.sec2samp(duration), trig);

euclidian(onset, div, pulses, rotation, phasor) = res
with {
    kph = int( ((phasor * div) % 1) * pulses);
    eucval = int((onset / pulses) * kph);
    cond(index) = 0, 1 : select2(eucval' != eucval);
    trig = 0, 1 : select2(kph' != kph);
    res = (trig & cond(kph));
};

// Controls
MAX_F = 12000;
MIN_F = 4000;
add = hslider("freq_add[acc: 0 0 -10 0 10]", MIN_F, MIN_F, MAX_F / 2, 1);
mult = hslider("freq_mult[knob:3]", MIN_F, MIN_F, MAX_F / 2, 1);
amp = hslider("amp", 0.9, 0, 1, 0.01) : si.smoo;
tog_amp = button("tog[switch:1]") : ba.toggle : si.smoo;
metro_speed = hslider("metro[acc: 1 0 -10 0 10]", 50,  1, 300, 0.1);

//DSP 
metro_freq = metro_speed / 60;
smetro = ba.beat(metro_speed) + os.impulse : *(tog_amp);
metro = euclidian( 
                    (abs(no.noise) + 1 * 1.55 : ba.sAndH(smetro + os.impulse))
                    , 2 
                    , 64
                    , 0 
                    , os.phasor(1, metro_freq));


rand = (abs(no.noise) * mult  + add ): ba.sAndH(metro + os.impulse);
plu = pm.pluckString(0.08, 1, 1, 1, 15, metro);
karp = pm.ks(0.1, 0.1, plu) : fi.dcblocker;
env = karp : an.amp_follower(0.001) : si.smoo;

Q = 5;
synt = pm.impulseExcitation(metro * tog_amp) 
    : ve.oberheimBPF(rand / MAX_F, Q) 
    : ve.oberheimBPF(rand / MAX_F, Q) 
    : *(3) 
    : co.compressor_mono(8,-5,0.01,0.01);
echoed = synt  
    : ef.echo(1, 0.05, 0.6) ;

process =  (synt + (echoed * 0.7) ) : *(amp) <: _,_;

