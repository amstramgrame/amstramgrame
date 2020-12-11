
// Créons un petit instrument !!

// On importe la bibliothèque de fonctions du language Faust pour 
// pouvoir programmer !!

import("stdfaust.lib");

// Programmons un génèrateur de vagues et de bourrasques de vent pour 
// agrémenter nos paysages sonores !!

// Il nous faut un bouton on/off pour activer le son !! Utilisons le bouton 
// (qui se presse) assignable du gramophone !!

gate = button("gate[switch:1]") : si.smoo;

// Générons du bruit blanc que nous pourrons sculpter pas la suite !!

Bruit_Blanc = no.noise;

// Sculptons le avec une enveloppe qui lui donnera la forme d'une vague 
// plus ou moins longue !!

Enveloppe = en.ar(longueur_Debut,longueur_Fin,gate);

// Réglons la longueur de la vague en l'assignant au potentiomètre (bouton 
// qui se tourne) programmable !! Ici la vague aura un début et une fin 
// symétrique !! Une petite impulsion sur le bouton on/off suffira à lancer 
// le son !!

longueur_Debut = hslider("longueur_Debut[knob:2]",2,0,5,0.01) : si.smoo;

longueur_Fin = hslider("longueur_Fin[knob:2]",2,0,5,0.01) : si.smoo;

// Nous avons notre vague !! Il nous faut maintenant l'adoucir avec un 
// filtre !! Celui-ci nous permettra aussi de simuler le vent qui tourne !!

Filtre = fi.resonbp(freqFilt,10,0.5);

// Avec l'accéléromètre, modulons sa fréquence, c'est-à-dire sa hauteur 
// entre le grave et l'aigüe pour changer la vitesse du vent !!

freqFilt = hslider("freqFilt[acc: 0 0 -10 0 10 ]",300,100,1000,0.1) : si.smoo;

// Il ne nous reste plus qu'à relier le bruit, l'enveloppe et le filtre 
// dans une dernière ligne de code qui pourra être compilée par notre 
// navigateur !!

process = Bruit_Blanc * Enveloppe : Filtre; 

// Notre simulateur de vagues et de vents est terminé !! Il sera parfait 
// pour créer de belles ambiances sonores et plonger nos auditeurs dans 
// une douce méditation !!

