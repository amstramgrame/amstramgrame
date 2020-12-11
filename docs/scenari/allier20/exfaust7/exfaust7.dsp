
import("stdfaust.lib");

gate = button("gate[switch:1]") : si.smoo;

longueur_Debut = hslider("longueur_Debut[knob:2]",2,0,5,0.01) : si.smoo;
longueur_Fin = hslider("longueur_Fin[knob:2]",2,0,5,0.01) : si.smoo;

freqFilt = hslider("freqFilt[acc: 0 0 -10 0 10 ]",300,100,1000,0.1) : si.smoo;


process = no.noise * en.ar(longueur_Debut,longueur_Fin,gate) : 
fi.resonbp(freqFilt,10,0.5); 

