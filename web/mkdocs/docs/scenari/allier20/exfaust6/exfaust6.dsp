
import("stdfaust.lib");

process = 
sy.fm(frqs(note1:gamme),indices)*lfo,sy.fm(frqs(note2:gamme),indices)*(1-lfo)
:> _*onOff;

frqs(f) = (f,3*f,5*f);
indices = (120,500);

note1 = hslider("freq1[acc:0 0 -10 0 10]",150,100,200,1);
note2 = hslider("freq2[acc:1 0 -10 0 10]",200,150,300,1);
onOff = button("on-off[switch:1]"):si.smoo;

lfo = os.osc(speed)*0.5+0.5;
speed = hslider("speed[knob:2]",3,1,10,0.1);

gamme = _:ba.hz2midikey:int<:
int(_/12)*12,(_%12<:_+(_==0)+(_==3)+(_==5)-(_==10)):
      +:ba.midikey2hz;

