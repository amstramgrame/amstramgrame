
// Créons un petit instrument !!

// On importe la bibliothèque de fonctions du language Faust pour pouvoir programmer !!

import("stdfaust.lib");

// Commençons par coder un petit synthétiseur !!

// Il nous faut un bouton on/off pour activer et arréter le son !! 
// Utilisons le bouton (qui se presse) assignable du gramophone !!

gate = button("gate[switch:1]") : si.smoo;

// Nous avons maintenant besoin de générer du son !! 
// Un oscillateur en dent de scie sera parfait pour cela !!

Synth = os.lf_saw(freqOsc) * gate;

// Modulons sa fréquence, c'est-à-dire sa hauteur entre le grave et l'aigüe !!

// Pour cela, utilisons les différents capteurs du Gramophone !!

// l'accéléromètre, ses axes et ses courbes (croissantes, décroissantes, 
// en cloche, en creux) [acc: x x -10 0 10]
// le potentiomètre (bouton qui se tourne) et qui n'est pas le volume [knob:2]
// le capteur de lumière [knob:3]

freqOsc = hslider("freqOsc[knob:2]",196,98,784,0.01) : si.smoo;

// Nous avons notre synthétiseur !!

// Rendons-le un plus riche en lui appliquant un effet.... Une WahWah par 
// exemple pour faire comme Jimi Hendrix !!

// Utilisons la fonction du language Faust qui émule la pédale de notre 
// célèbre Guitar Hero !!

WahWah = ve.crybaby(posPied);

// Simulons la position du pied et modulons-la de la même façon que la 
// fréquence de l'oscillateur !!

posPied = hslider("posPied[acc: 0 0 -10 0 10 ]",0.5,0,1,0.01) : si.smoo;

// Il ne nous reste plus qu'à relier le synthétiseur et la pédale dans une 
// dernière ligne de code qui pourra être compilée par notre navigateur !! 

process = Synth : WahWah;

// Notre instrument est fini !! Chargeons-le sur notre Gramophone et essayons 
// différentes affectations de nos variables (freqOsc et posPied) !! 

// On pourra même reproduire un gimmick d'une chanson super connue du groupe 
// "The Prodigy" !!

