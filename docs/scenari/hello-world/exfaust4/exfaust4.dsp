
import("stdfaust.lib");
on = button("on-off");
freq = hslider("frequence",440,20,3000,1);
process = os.osc(freq)*on;
 
