# Quelques programmes Faust pour Gramophone

Cette page rassemble une collection de programmes Faust pour Gramophone prêts à l’emploi.

## Programmes "Fusions (Meslay)" (Johann Philippe)

### `acid_sea`

<!-- faust-run -->
```
declare name            "AcidSea";
declare version         "1.0";
declare author          "Johann Philippe";
declare license         "MIT";
declare copyright       "(c) Johann Philippe 2022";
/*
	A filtered noise with flanger and comb filter
*/

import("stdfaust.lib");

// Linear  interpolation when value changes
line(time, sig) = res
letrec {
	'changed = (sig' != sig) | (time' != time);
	'steps = ma.SR * time;
	'cntup = ba.countup(steps ,changed);  
	'diff = ( sig - res);
	'inc = diff / steps : ba.sAndH(changed);
	'res = res, res + inc : select2(cntup <  steps);
};

// Controls
freq = hslider("freq[acc: 1 0 -10 0 10]", 2, 1.5, 10, 0.01);
mixer = hslider("mix[knob:2]", 0, 0, 1, 0.01) : si.smoo;
comb_ctl = hslider("comb[acc: 0 0 -10 0 10]", 512, 256, 2048, 1);
filter_fq = hslider("f_freq[acc: 1 0 -10 0 10]", 0.001, 0.001,0.999, 0.0001 ) : line(2);
lfo_add = hslider("lfo[acc: 0 0 -10 0 10]", 0, 0, 4, 0.01);
delay = os.osc( hslider("flanger_freq[acc: 2 0 -10 0 10]", 0.1, 0.01, 1, 0.001) /(2) ) :
      abs : *(9);
btn = button("change[switch:1]");

depth = 0.7;
fb = 0.7;
synth = no.noise 
	: pf.flanger_mono(10, freq + (os.osc(freq / 8)) , 1, 0.9, 0);
cmb = synth 
	: fi.fbcombfilter(2048, comb_ctl, 0.5);
get_base_fq(trig) = abs(no.noise) * 100 + 100 
	: ba.sAndH(trig);
base_fq = get_base_fq(btn + os.impulse) 
	: line(mult);
get_mult(trig) = abs(no.noise) * 8 + 1 
	: ba.sAndH(trig);
mult = get_mult(btn + os.impulse);
saw = sum(n, 4, os.sawtooth(base_fq + (n * (base_fq / 2))) / (n + 1) *
    os.lf_pulsetrain((n +1) / 2 + lfo_add, 0.5));
sg = synth + (cmb * mixer);
process = sg 
	: *(0.35) 
	: ve.korg35LPF(filter_fq, 1);
```
<!-- /faust-run -->

### `canon`

<!-- faust-run -->
```
declare name            "Canon";
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
	//count =  -(1)~_, smps_dur : select2(trig);
	pulsation = 0, 1 : select2(count > 0);
};
mpulse_dur(duration, trig) = mpulse(ba.sec2samp(duration), trig);

// A recursive delay
recdel(max_smps, smps, fb) = +~de.delay(max_smps,smps) * fb;
// Can be mixed with dry signal
mix_recdel(mix, max_smps, smps, fb, sig) = sig : recdel(max_smps, smps, fb) :
		_*mix + sig * (1 - mix); 

// Controls 
btn = button("trig[switch:1]");
noise_amount = hslider("noise", 0, 0, 100, 1);
freq = hslider("freq[acc: 1 0 -10 0 10]", 80, 70, 200, 1) 
	: +(nz) 
	: ba.sAndH( on_click(btn) + os.impulse);
del = hslider("del_fq[acc: 0 0 -10 0 10]", 100, 100, 1000, 1) 
	: ba.sAndH(os.impulse | on_click(btn));
amp = hslider("amp", 1.5, 0, 2, 0.01) : si.smoo;

// Signal processing 
nz = no.noise : abs : *(noise_amount);
// Sawtooth with sine subharmonic
sig = os.sawtooth(freq) + (os.osc(freq /2) / 2);
// Exponential ADSR envelope
env = btn : en.adsre(0.001, 0.1, 0.5, 1);

process = sig 
	: *(0.5) 
	: fi.resonlp(env * freq * 2 + 100, 1, 1) 
	: mix_recdel(0.4, 1000, del, 0.99) 
	: mix_recdel(0.3, 10000, 10000, 0.8) 
	: *(amp) 
	:  *(env);
```
<!-- /faust-run -->

### `whale`

<!-- faust-run -->
```
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
```
<!-- /faust-run -->

### `euclidian_rain`

<!-- faust-run -->
```
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
```
<!-- /faust-run -->

### `lighting_in_the_dark`

<!-- faust-run -->
```
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
```
<!-- /faust-run -->

### `strange_echo`

<!-- faust-run -->
```
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
```
<!-- /faust-run -->

### `particles_in_space`

<!-- faust-run -->
```
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
```
<!-- /faust-run -->

### `sun`

<!-- faust-run -->
```
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
```
<!-- /faust-run -->

### `uranus`

<!-- faust-run -->
```
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
```
<!-- /faust-run -->

### `wah_synthesizer`

<!-- faust-run -->
```
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
<!-- /faust-run -->
```

### `jungle_euclidian_rhythm`

<!-- faust-run -->
```
declare name            "Jungle Euclidian Rhythm";
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
	//count =  -(1)~_, smps_dur : select2(trig);
	pulsation = 0, 1 : select2(count > 0);
};
mpulse_dur(duration, trig) = mpulse(ba.sec2samp(duration), trig);

/*
	Euclidian function. Generates an euclidian rythm with 0;1 triggers
*/
euclidian(onset, div, pulses, rotation, phasor) = res
with {
	kph = int( ((phasor * div) % 1) * pulses);
	eucval = int((onset / pulses) * kph);
	cond = 0, 1 : select2(eucval' != eucval);
	trig = 0, 1 : select2(kph' != kph);
	res = (trig & cond);
};

// Frequency of euclidian rhythm 
BPM = 60;
EUC_FQ = BPM / 60;

speed_mult = hslider("mult[knob:2]", 0.5, 0.5, 1.5, 0.01);
noise_amount = hslider("noise[acc: 0 0 -10 0 10]", 0, 0, 300, 1);
amp = hslider("amp", 1.5, 0, 2, 0.01) 
	: si.smoo;
trig = button("trig[switch:1]") 
	: ba.toggle 
	: si.smoo;

metro = euclidian(
	2.567,
	2 * speed_mult,
	64,
	0, 
	os.phasor(1, EUC_FQ)
);

nz = no.noise : abs : *(noise_amount);
freq = hslider("freq[acc: 1 0 -10 0 10]", 80, 70, 250, 1) 
	: +(nz) 
	: ba.sAndH( metro + os.impulse);

noise_gen = no.noise : *(0.8) : ve.korg35LPF(0.8, 1);
// Audio signal 
sig = os.sawtooth(freq) + (os.osc(freq /2) / 2) + noise_gen; 

ATQ = 0.05;
env = metro : mpulse_dur(ATQ) : en.adsre(ATQ, 0.1, 0.3, 0.4);
// Filter audio signal
flt = sig 
	: *(0.5) 
	: fi.resonbp(env * freq * 2 + 100, 5, 1) 
	: fi.resonbp(env * freq * 4 + 100, 0.5, 1);

process = sig 
	: *(0.5) 
	: fi.resonbp(env * freq * 2 + 100, 5, 1) 
	: fi.resonbp(env * freq * 4 + 100, 0.5, 1) 
	: *(amp) 
	:  *(env) 
	: *(trig);
```
<!-- /faust-run -->

## Programmes "ateliers musique des profondeurs" (Luc Faure)

### `BALEINE`

<!-- faust-run -->
```
import("stdfaust.lib");

// enveloppe
env = button("gate[switch:1]"):en.adsr(1,0.1,0.6,1):si.smooth(0.9); 

// Synth
freq_synth = hslider("freq_synth[acc: 0 0 -10 0 10]",360,60,1200,1);
synth = os.osc(freq_synth) : ef.echo(0.2,0.2,0.3);

// Reverb
roomsize = hslider("Room Size[knob:2]", 0.5, 0, 1, 0.05);

reverb = _<: (*(g)*fixedgain : re.mono_freeverb(combfeed, allpassfeed, damping,
       spatSpread)),*(1-g), *(1-g) :> _
with{
	scaleroom   = 0.28;
	offsetroom  = 0.7;
	allpassfeed = 0.5;
	scaledamp   = 0.1;
	fixedgain   = 0.1;
	origSR = 44100;
	damping = 0.2*scaledamp*origSR/ma.SR;
	combfeed = roomsize*scaleroom*origSR/ma.SR + offsetroom;
	spatSpread = 0.5*46*ma.SR/origSR: int;
	g = 0.4;
};

// DSP
process = synth*env*0.8 : reverb;
```
<!-- /faust-run -->

### `CACHALOT`

<!-- faust-run -->
```
import("stdfaust.lib");
process = beat:>ef.cubicnl(0.1,0) : bitReducer(bits) :
	fi.fb_fcomb(1024,del,1,fb) * 0.8 : phaser(1,depth):reverb;

gate = checkbox("gate[switch:1]");

kickVol = 1;
env = rPulse * 1:en.ar(0.01,0.15);

rPulse = ba.pulse((no.noise:ba.latch(ba.pulse(11025))*15000+30000)*rate);

// Densite de la pluie
//rate = hslider("rate[acc:0 2 -10 0 10]",10, 2,15,0.01);
rate = 1.7 + (3 *gate);

phaser(r,d) = _<: _,de.fdelay((os.osc(r)*0.5*d+0.5)*800+500,1001):>_*0.5;
depth = hslider("depth[acc: 1 0 -10 0 10]",0.5,0,2,0.01);
//period = hslider("period[knob:2]",0.4,0.1,1,0.01) : ba.sec2samp;
beat = os.osc(env*40+20)*env*kickVol;

bits = hslider("bits[knob:2]",8,1,8,1);
bitReducer(bits) = _*(pow(2,bits)):int(_)/pow(2,bits);

del = hslider("del[acc: 1 1 -10 0 10]",525,500,1000,1) : si.smoo;
//fb = hslider("fb[acc: 0 1 -10 0 10]",0.9,0.8,0.98,0.001);
fb = 0.96;
// Reverbe
reverb = _<: (*(g)*fixedgain : re.mono_freeverb(combfeed, allpassfeed, damping,
       spatSpread)),*(1-g), *(1-g) :> _
with{
	scaleroom   = 0.28;
	offsetroom  = 0.7;
	allpassfeed = 0.5;
	scaledamp   = 0.1;
	fixedgain   = 0.1;
	origSR = 44100;

	damping = 0.2*scaledamp*origSR/ma.SR;
	combfeed = 1*scaleroom*origSR/ma.SR + offsetroom;
	spatSpread = 0.5*46*ma.SR/origSR: int;
	g = 0.4;
};

```
<!-- /faust-run -->

### `GOUTTES`

<!-- faust-run -->
```
import("stdfaust.lib");

// Bouton On/Off
gate = button("drop[switch:1]");

// Freq Bulle
freq_bulle = hslider("freq_bulle[acc: 0 0 -10 0 10]",600,150,3000,1);

// Feedback Echo
fdb_echo = hslider("fdb_echo[knob:2]",0.5,0,0.9,0.01) : si.smoo;

// Longueur Delay
del_echo = hslider("del_echo[acc: 1 0 -10 0 10]",0.25,0.1,0.4,0.01) : si.smoo;

// Bulle
bubble(f0,trig) = os.osc(f) * (exp(-damp*time) : si.smooth(0.99))
	with {
		damp = 0.043*f0 + 0.0014*f0^(3/2);
		f = f0*(1+sigma*time);
		sigma = eta * damp;
		eta = 0.075;
		time = 0 : (select2(trig>trig'):+(1)) ~ _ : ba.samp2sec;
	};

// DSP
process = gate : bubble(freq_bulle) : ef.echo(0.4,del_echo,fdb_echo) * 0.8;
```
<!-- /faust-run -->

### `KRAKEN60_Vibrato`

<!-- faust-run -->
```
import("stdfaust.lib");

// Bouton On/Off
gate = checkbox("gate[switch:1]");

//Synth
freq_synth = 60;
synth = os.sawtooth(freq_synth+vibrato);

//Distortion
drive = hslider("drive[acc: 1 3 -10 0 10]",0,0,1,0.01) : si.smoo;
distortion = ef.cubicnl(drive,0); 

//Filtre modulant 1
lfo1 = (os.sawtooth(2)+1)/2;
freq_filt1 = hslider("freq_filt[knob:2]",500,60,2000,1);
filtre1 = fi.resonlp(lfo1*freq_filt1,1,1);

//Filtre modulant 2
vit_env = 1;
lfo2 = (os.sawtooth(vit_env)+1)/2:si.smoo;
freq_filt2 = freq_filt1 * 8;
filtre2 = fi.resonlp(lfo2*freq_filt2,1,1);
lfo_amp = (os.osc(freq_lfo2)+1)/4;
amp = lfo_amp - (0.5 - lfo_amp);
freq_lfo2 = 6;

// vitesse du vibrato
vitVib = hslider("vitesseVibrato[acc: 0 0 -10 0 10]",10,0,600,0.1) : si.smoo;

// amplitude du vibrato
ampVib = hslider("amplitudeVibrato[acc: 1 0 -10 0 10]",60,0,480,0.1) : si.smoo;

// la fonction vibrato
vibrato = os.osc(vitVib)*ampVib;

//DSP 
process = synth * gate : distortion * 0.8 <: filtre1, filtre2 :> _ * amp;
```
<!-- /faust-run -->

### `PLUIE_COMB`

<!-- faust-run -->
```
import ("stdfaust.lib");

// Bouton On/Off
gate = checkbox("gate[switch:1]");

// Impulsion de bruit
randomer(rP) = rP:en.ar(0.001,0.001)*no.noise:fi.resonbp(rng+300,7,2);
rng = no.noise:ba.latch(rPulse(no.noise)>0)*100+200;
rPulse(noi) = ba.pulse((noi:ba.latch(ba.pulse(11025))*15000+30000)*rate);

// Densite de la pluie
rate = hslider("rate[acc:0 2 -10 0 10]",5,0.1,10,0.01);


// Reverbe
reverb = _<: (*(g)*fixedgain : re.mono_freeverb(combfeed, allpassfeed, damping,
       spatSpread)),*(1-g), *(1-g) :> _
with{
	scaleroom   = 0.28;
	offsetroom  = 0.7;
	allpassfeed = 0.5;
	scaledamp   = 0.1;
	fixedgain   = 0.1;
	origSR = 44100;

	damping = 0.2*scaledamp*origSR/ma.SR;
	combfeed = 1*scaleroom*origSR/ma.SR + offsetroom;
	spatSpread = 0.5*46*ma.SR/origSR: int;
	g = 0.4;
};

// Controle filtre en peigne
del = hslider("del[acc: 1 0 -10 0 10]",200,50,400,1) : si.smoo;
fb = hslider("fb[knob:2]",0.5,0,0.97,0.001);

// DSP
process = no.multinoise(10):par(i,10,randomer(rPulse(_))*0.4*gate :
	fi.lowpass(1,1000)):>_* 0.8 : fi.fb_fcomb(1024,del,1,fb) : reverb;
```
<!-- /faust-run -->

## Programmes "historiques"

### `TicTac`

Le programme `TicTac` produit des petits clics à intervalles réguliers. Ces derniers sont filtrés pour appliquer une hauteur au son produit puis envoyés dans un écho pour augmenter la densité de la texture sonore produite. Les paramètres du son sont contrôlés avec l'[accéléromètre](about.md#les-capteurs-de-mouvements) et le [potentiomètre assignable](about.md#le-potentiometre-assignable). La production de "clics" est enclenchée lorsque le [bouton assignable](about.md#le-bouton-assignable) est pressé.  

<!-- faust-run -->
```
import("stdfaust.lib");

// parameters
impFreq = hslider("impFreq[acc: 1 0 -10 0 10]",11,2,20,0.01) : si.smoo;
resFreq = hslider("resFreq[acc: 0 1 -10 0 10]",1650,300,3000,0.01) : si.smoo;
distDrive = hslider("distDrive[knob:2]",0,0,1,0.01) : si.smoo;
q = hslider("q[knob:3]",30,10,50,0.01) : si.smoo;
del = hslider("del[acc: 0 1 -10 0 10]",0.2,0,0.4,0.01) : si.smoo;
fb = hslider("fb[acc: 1 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;
gate = button("gate[switch:1]");

// DSP
process = os.lf_imptrain(impFreq)*gate  : fi.resonlp(resFreq,q,1) : 
ef.echo(0.4,del,fb) : ef.cubicnl(distDrive,0)*0.95;
```
<!-- /faust-run -->

### `Pioupiou`

`Pioupiou` est un programme pour Gramophone où la hauteur du son produit (une simple sinusoïde) est contrôlée par le [capteur de lumière](#la-photoresistance) du Gramophone. Le [bouton assignable](about.md#le-bouton-assignable) permet de lancer la production du son. 

<!-- faust-run -->
```
import("stdfaust.lib");

// parameters
freq = hslider("freq[knob:3]",300,100,4000,0.01) : si.smoo;
gate = button("gate[switch:1]") : si.smoo;

// DSP
process = os.osc(freq)*gate;
```
<!-- /faust-run -->

### `Clarinet`

Le programme `Clarinet` est basé sur un synthétiseur (modèle physique) de clarinette. La pression du souffle du clarinettiste, la raideur de l'anche, et le diamètre du pavillon sont contrôlés par les [capteurs de mouvements](about.md#les-capteurs-de-mouvements) du Gramophone. La longueur du tube de la clarinette (qui impacte la hauteur du son) est contrôlée par le [potentiomètre assignable](about.md#le-potentiometre-assignable). Le [bouton assignable](about.md#le-bouton-assignable) permet d'activer le souffle du clarinettiste. 

<!-- faust-run -->
```
import("stdfaust.lib");

// parameters
gate = button("gate[switch:1]");
pressure = hslider("pressure[acc: 0 1 -10 0 10]",0.5,0,1,0.01);
reed = hslider("reed[knob:3]",0.5,0,1,0.01) : si.smooth(0.99);
bell = hslider("bell[acc: 2 0 -10 0 10]",0.5,0,1,0.01) : si.smooth(0.99);
tube = hslider("note[knob:2]",60,40,70,3) : ba.midikey2hz : pm.f2l : si.smooth(0.99);

// additional mappings
pres = gate*pressure : si.smooth(0.99);

process = pm.clarinetModel(tube,pres,reed,bell); 
```
<!-- /faust-run -->

### `Comb`

`Comb` est un instrument pour Gramophone très simple basé sur un filtre en peigne. Les [capteurs de mouvements](about.md#les-capteurs-de-mouvements) du Gramophone contrôlent le volume et la hauteur du son produit. Le [potentiomètre assignable](about.md#le-potentiometre-assignable) contrôle l'agressivité et la résonance du son. Le [bouton assignable](about.md#le-bouton-assignable) permet d'activer la production du son.

<!-- faust-run -->
```
import("stdfaust.lib");

// parameters
gate = button("gate[switch:1]");
gain = hslider("gain[acc: 0 1 -10 0 10]",0.5,0,1,0.01)^2;
del = hslider("del[acc: 1 0 -10 0 10]",525,50,1000,1) : si.smoo;
fb = hslider("fb[knob:2]",0.7,0.5,1,0.001);

process = no.noise*gate*gain : fi.fb_fcomb(1024,del,1,fb); 
```
<!-- /faust-run -->

### `FM`

`FM` est un instrument pour Gramophone basé sur un synthétiseur FM (modulation de fréquence). Le [bouton assignable](about.md#le-bouton-assignable) peut être utilisé comme un interrupteur pour activer et désactiver le son. La hauteur du son produit peut être contrôlée avec le [potentiomètre assignable](about.md#le-potentiometre-assignable). Les [capteurs de mouvements](about.md#les-capteurs-de-mouvements) du Gramophone permettent de contrôler le timbre du son.

<!-- faust-run -->
```
import("stdfaust.lib");

// parameters
gate = checkbox("gate[switch:1]") : si.smoo;
freq0 = hslider("freq0[knob:2]",200,50,500,0.01) : si.smoo;
ratio1 = hslider("ratio1[acc: 0 1 -10 0 10]",1.5,1,2,0.01) : si.smoo;
ratio2 = hslider("ratio2[acc: 1 0 -10 0 10]",1.5,1,2,0.01) : si.smoo;
index1 = hslider("index1[acc: 1 1 -10 0 10]",500,0,1000,0.01) : si.smoo;
index2 = hslider("index2[knob:3]",500,0,1000,0.01) : si.smoo;

// mappings
freq1 = freq0*ratio1;
freq2 = freq1*ratio2;

process = sy.fm((freq0,freq1,freq2),(index1,index2))*gate; 
```
<!-- /faust-run -->

### `Brass`

`Brass` est un instrument pour Gramophone basé sur un synthétiseur de trompette (modèle physique). Le [bouton assignable](about.md#le-bouton-assignable) permet d'activer le souffle. Le [potentiomètre assignable](about.md#le-potentiometre-assignable) contrôle la distortion du son et peut être utilisé pour augmenter le gain de l'instrument. Les autres paramètres du modèle sont contrôlés par les [capteurs de mouvements](about.md#les-capteurs-de-mouvements).

<!-- faust-run -->
```
import("stdfaust.lib");

// parameters
gate = checkbox("gate[switch:1]");
p = hslider("p[acc: 0 1 -10 0 10]",0.5,0,1,0.01) : si.smoo;
lips = hslider("lips[acc: 2 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;
tube = hslider("note[acc: 1 0 -10 0 10]",60,40,70,3) : ba.midikey2hz : pm.f2l;
dist = hslider("dist[knob:2]",0,0,1,0.01) : si.smoo;

// mappings
pres = gate*p;

process = pm.brassModel(tube,lips,0,pres) : ef.cubicnl(dist,0)*0.95; 
```
<!-- /faust-run -->

### `Violin`

`Violin` est un instrument pour Gramophone basé sur un synthétiseur de violon (modèle physique). Le [bouton assignable](about.md#le-bouton-assignable) permet d'initier le mouvement de l'archet. Le [potentiomètre assignable](about.md#le-potentiometre-assignable) contrôle la longueur de la corde et donc la hauteur du son produit. Les autres paramètres du modèle sont contrôlés par les [capteurs de mouvements](about.md#les-capteurs-de-mouvements).

<!-- faust-run -->
```
import("stdfaust.lib");

// parameters
gate = checkbox("gate[switch:1]");
stringLength = hslider("stringLength[knob:2]",1.5,0.5,3,0.01);
bowVelocity = hslider("p[acc: 0 1 -10 0 10]",0.1,0,1,0.01)*gate;
bowPressure = hslider("lips[gyr: 0 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;
bowPosition = hslider("dist[acc: 1 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;

process = pm.violinModel(stringLength,bowPressure,bowVelocity,bowPosition); 
```
<!-- /faust-run -->
