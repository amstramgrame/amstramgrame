
import("stdfaust.lib");

process = os.sawtooth(freq:gamme:si.smooth(0.999)) : 
fi.lowpass3e(1000*env+10)*env:ef.echo(0.2,0.2,fdbk);

gamme = _ : ba.hz2midikey : int <:  // cette fonction sert à jouer les notes de la gamme
int(_/12)*12,(_%12<:_+(_==0)+(_==3)+(_==5)-(_==10)) :
+ : ba.midikey2hz;

freq = hslider("freq[acc:0 0 -10 0 10]",400,200,800,1);
fdbk = hslider("feedback[knob:2]",0,0,0.9,0.01);
env = button("on[switch:1]"):en.adsr(0.3,0.1,1,0.3):si.smooth(0.9); 
// le smooth supprime les 'pop' quand on appuie sur le boutton.

