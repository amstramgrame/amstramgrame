import("stdfaust.lib");

// parameters
freq = hslider("freq[knob:3]",300,100,4000,0.01) : si.smoo;
gate = button("gate[switch:1]") : si.smoo;

// DSP
process = os.osc(freq)*gate;
