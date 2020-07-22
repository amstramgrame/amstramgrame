
import("stdfaust.lib");
on = button("on-off");
process = os.osc(hslider("frequence",440,20,3000,1))*on;
 
