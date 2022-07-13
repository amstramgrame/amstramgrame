
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

