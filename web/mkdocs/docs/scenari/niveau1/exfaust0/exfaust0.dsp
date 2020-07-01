
import("stdfaust.lib");

shake_x = hslider("X [acc: 0 0 -13 0 13][hidden:1]", 0, -100, 100, 0.001);
shake_y = hslider("Y [acc: 1 0 -14 0 14][hidden:1]", 0, -100, 100, 0.001);

well = +((abs(shake_x + shake_x')) > 100) ~ *(0.99) : min(1) : max(0);

russianBell_ui = pm.russianBell(strikePosition,strikeCutoff,strikeSharpness,gain,gate)
with {
  strikePosition = nentry("v:russianBell/[0]strikePosition",
	0,0,4,1);
	strikeCutoff = hslider("v:russianBell/[1]strikeCutOff",
	6500,20,20000,1);
	strikeSharpness = hslider("v:russianBell/[2]strikeSharpness",
	0.5,0.01,5,0.01);
	gain = hslider("v:russianBell/[3]gain [knob:1]",1,0,1,0.01);
	gate = well;
};

process = russianBell_ui <: _,_;

