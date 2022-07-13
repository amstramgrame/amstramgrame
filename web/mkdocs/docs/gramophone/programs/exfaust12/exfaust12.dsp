
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


