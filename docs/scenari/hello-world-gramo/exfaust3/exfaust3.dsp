
import("stdfaust.lib");
on = button("on-off[switch:1]");
freq = hslider("frequence[knob:3]",440,20,3000,1);
process = os.osc(freq)*on;
 
