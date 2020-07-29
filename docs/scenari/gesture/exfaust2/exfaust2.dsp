
import("stdfaust.lib");

freq = hslider("freq[acc: 0 1 -10 0 10]",200,100,2000,0.01) : si.smoo;
gate = checkbox("gate[switch:1]") : si.smoo;

process = os.osc(freq)*gate;

