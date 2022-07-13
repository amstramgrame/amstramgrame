
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

