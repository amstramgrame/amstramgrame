
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

