
import("stdfaust.lib");
on = button("on-off");
process = os.osc(440)*on;
 
