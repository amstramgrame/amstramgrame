
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

