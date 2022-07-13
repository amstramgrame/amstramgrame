
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

