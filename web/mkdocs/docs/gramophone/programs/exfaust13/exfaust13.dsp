
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

