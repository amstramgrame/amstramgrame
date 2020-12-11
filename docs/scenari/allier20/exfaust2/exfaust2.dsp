
import("stdfaust.lib");

process = par(i,4,os.osc(noteSelector(selAccord,i))+os.osc(noteSelector(selAccord,i)*2 : 
si.smooth(0.999))) :> _/5 : _*0.1 : effet*onOff;

noteSelector(accord,note) =     
  54,57,61,68, 
  52,54,59,62,
  52,55,62,64 :
  ba.selectn(12,int(accord*4)+int(note)):ba.midikey2hz;

selAccord = hslider("accord[acc:0 0 -10 0 10]",1,0,2,1);
gain = hslider("gain[acc:1 0 -10 0 10]",0,0,0.5,0.01);
vibrato = hslider("vibrato[knob:2]",1,1,5,0.01);
onOff = button("on-off[switch:1]"):si.smoo;
effet = ef.cubicnl(gain,0):fi.highpass3e(500+400*os.osc(vibrato));

