# Formation Amstramgrame - Canopé Allier - Décembre 2020

## `CrazyMarimba.dsp`

<!-- faust-run -->
```
import("stdfaust.lib");
gate = button("gate[switch:1]");
freqm = hslider("freqm[acc: 1 0 -10 0 10]",500,100,2000,1);
modem = hslider("modem[knob:2]",1,0,4,1);
tempo = 480;
envtrig = ba.beat(tempo) * gate;
del = hslider("del[acc: 0 1 -10 0 10]",0,0,0.1,0.01) : si.smoo;
//fb = hslider("fb[knob:3]",0.5,0,0.8,0.01) : si.smoo;
process = pm.strike(1,0.8,1,envtrig) : 
pm.marimbaModel(freqm,modem) : 
ef.echo(0.4,del,0.8);
```
<!-- /faust-run -->

## `EPercu.dsp`

<!-- faust-run -->
```
import("stdfaust.lib");

process = bong,bang :> _;

bong = os.square(boEnv*150+no.noise*100*boEnv)*boEnv:fi.lowpass3e(100+800*boEnv);
boEnv = button("bong[switch:1]"):ba.impulsify:en.ar(0.01,0.4);

bang = no.noise:fi.bandpass(2,1000,3000)*baEnv:ef.echo(0.2,0.2,0.2)*2;
baEnv = (hslider("bang[acc:1 0 -10 0 10]",4,0,10,1)>9):ba.impulsify:en.ar(0.01,0.2);
```
<!-- /faust-run -->

## `HoneyMood.dsp`

<!-- faust-run -->
```
import("stdfaust.lib");

process = par(i,4,os.osc(noteSelector(selAccord,i))+os.osc(noteSelector(selAccord,i)*2 : 
si.smooth(0.999))) :> _/5 : _*0.1 : effet*onOff;

noteSelector(accord,note) =     
  54,57,61,68, 
  52,54,59,62,
  52,55,62,64 :
  ba.selectn(12,int(accord*4)+int(note)):ba.midikey2hz;

selAccord = hslider("accord[acc:0 0 -10 0 10]",1,0,2,1);
gain = hslider("gain[acc:1 0 -10 0 10]",0,0,0.5,0.01);
vibrato = hslider("vibrato[knob:2]",1,1,5,0.01);
onOff = button("on-off[switch:1]"):si.smoo;
effet = ef.cubicnl(gain,0):fi.highpass3e(500+400*os.osc(vibrato));
```
<!-- /faust-run -->

## `SawWah.dsp`

<!-- faust-run -->
```
import("stdfaust.lib");

gate = button("gate[switch:1]") : si.smoo;
freqOsc = hslider("freqOsc[knob:2]",196,98,784,0.01) : si.smoo;
posPied = hslider("posPied[acc: 0 0 -10 0 10 ]",0.5,0,1,0.01) : si.smoo;

process = os.lf_saw(freqOsc) * gate : ve.crybaby(posPied);
```
<!-- /faust-run -->

## `SawWahPedago.dsp`

<!-- faust-run -->
```
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
```
<!-- /faust-run -->

## `SpaceTrumpet.dsp`

<!-- faust-run -->
```
import("stdfaust.lib");

process = os.sawtooth(freq:gamme:si.smooth(0.999)) : 
fi.lowpass3e(1000*env+10)*env:ef.echo(0.2,0.2,fdbk);

gamme = _ : ba.hz2midikey : int <:  // cette fonction sert à jouer les notes de la gamme
int(_/12)*12,(_%12<:_+(_==0)+(_==3)+(_==5)-(_==10)) :
+ : ba.midikey2hz;

freq = hslider("freq[acc:0 0 -10 0 10]",400,200,800,1);
fdbk = hslider("feedback[knob:2]",0,0,0.9,0.01);
env = button("on[switch:1]"):en.adsr(0.3,0.1,1,0.3):si.smooth(0.9); 
// le smooth supprime les 'pop' quand on appuie sur le boutton.
```
<!-- /faust-run -->

## `StrangeSiren.dsp`

<!-- faust-run -->
```
import("stdfaust.lib");

process = 
sy.fm(frqs(note1:gamme),indices)*lfo,sy.fm(frqs(note2:gamme),indices)*(1-lfo)
:> _*onOff;

frqs(f) = (f,3*f,5*f);
indices = (120,500);

note1 = hslider("freq1[acc:0 0 -10 0 10]",150,100,200,1);
note2 = hslider("freq2[acc:1 0 -10 0 10]",200,150,300,1);
onOff = button("on-off[switch:1]"):si.smoo;

lfo = os.osc(speed)*0.5+0.5;
speed = hslider("speed[knob:2]",3,1,10,0.1);

gamme = _:ba.hz2midikey:int<:
int(_/12)*12,(_%12<:_+(_==0)+(_==3)+(_==5)-(_==10)):
      +:ba.midikey2hz;
```
<!-- /faust-run -->

## `WindAndWave.dsp`

<!-- faust-run -->
```
import("stdfaust.lib");

gate = button("gate[switch:1]") : si.smoo;

longueur_Debut = hslider("longueur_Debut[knob:2]",2,0,5,0.01) : si.smoo;
longueur_Fin = hslider("longueur_Fin[knob:2]",2,0,5,0.01) : si.smoo;

freqFilt = hslider("freqFilt[acc: 0 0 -10 0 10 ]",300,100,1000,0.1) : si.smoo;


process = no.noise * en.ar(longueur_Debut,longueur_Fin,gate) : 
fi.resonbp(freqFilt,10,0.5); 
```
<!-- /faust-run -->

## `WindAndWavePedago.dsp`

<!-- faust-run -->
```
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
```
<!-- /faust-run -->
