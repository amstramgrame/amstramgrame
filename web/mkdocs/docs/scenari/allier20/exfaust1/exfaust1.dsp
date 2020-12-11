
import("stdfaust.lib");

process = bong,bang :> _;

bong = os.square(boEnv*150+no.noise*100*boEnv)*boEnv:fi.lowpass3e(100+800*boEnv);
boEnv = button("bong[switch:1]"):ba.impulsify:en.ar(0.01,0.4);

bang = no.noise:fi.bandpass(2,1000,3000)*baEnv:ef.echo(0.2,0.2,0.2)*2;
baEnv = (hslider("bang[acc:1 0 -10 0 10]",4,0,10,1)>9):ba.impulsify:en.ar(0.01,0.2);

