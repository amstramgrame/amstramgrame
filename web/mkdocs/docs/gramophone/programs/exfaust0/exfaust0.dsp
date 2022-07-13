
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

