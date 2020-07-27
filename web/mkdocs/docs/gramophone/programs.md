# Quelques programmes Faust pour Gramophone

## TicTac

Le programme `TicTac` produit des petits clics à interval réguliers. Ces derniers sont filtrés pour appliquer une hauteur au son produit puis envoyés dans un écho pour augmenter la densité de la texture sonore produite. Les paramètres du son sont contrôlés avec l'[accéléromètre](about.md#les-capteurs-de-mouvements) et le [potentiomètre assignable](about.md#le-potentiometre-assignable). La production de "clics" est enclenchée lorsque le [bouton assignable](about.md#le-bouton-assignable) est pressé.  

<!-- faust-run -->
<div class="faust-run"><img src="exfaust0/exfaust0.svg" class="mx-auto d-block">
~~~

import("stdfaust.lib");

// parameters
impFreq = hslider("impFreq[acc: 1 0 -10 0 10]",11,2,20,0.01) : si.smoo;
resFreq = hslider("resFreq[acc: 0 1 -10 0 10]",1650,300,3000,0.01) : si.smoo;
distDrive = hslider("distDrive[knob:2]",0,0,1,0.01) : si.smoo;
q = hslider("q[knob:3]",30,10,50,0.01) : si.smoo;
del = hslider("del[acc: 0 1 -10 0 10]",0.5,0.01,1,0.01) : si.smoo;
fb = hslider("fb[acc: 1 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;
gate = button("gate[switch:1]");

// simple echo effect
echo = +~(de.delay(20000,del*20000)*fb);

// DSP
process = os.lf_imptrain(impFreq)*gate  : fi.resonlp(resFreq,q,1) : echo : 
ef.cubicnl(distDrive,0)*0.95;

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/gramophone/programs/exfaust0/exfaust0.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

## Clarinet

Le programme `Clarinet` est basé sur un synthétiseur (modèle physique) de clarinette. La pression du souffle du clarinettiste, la raideur de l'anche, et le diamètre du pavillon sont contrôlés par les [capteurs de mouvements](about.md#les-capteurs-de-mouvements) du Gramophone. La longueur du tube de la clarinette (qui impacte la hauteur du son) est contrôlée par le [potentiomètre assignable](about.md#le-potentiometre-assignable). Le [bouton assignable](about.md#le-bouton-assignable) permet d'activer le souffle du clarinettiste. 

<!-- faust-run -->
<div class="faust-run"><img src="exfaust1/exfaust1.svg" class="mx-auto d-block">
~~~

import("stdfaust.lib");

// parameters
gate = button("gate[switch:1]");
pressure = hslider("pressure[acc: 0 1 -10 0 10]",0.5,0,1,0.01);
reed = hslider("reed[knob:3]",0.5,0,1,0.01) : si.smooth(0.99);
bell = hslider("bell[acc: 2 0 -10 0 10]",0.5,0,1,0.01) : si.smooth(0.99);
tube = hslider("note[knob:2]",60,40,70,3) : ba.midikey2hz : pm.f2l : si.smooth(0.99);

// additional mappings
pres = gate*pressure : si.smooth(0.99);

process = pm.clarinetModel(tube,pres,reed,bell); 

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/gramophone/programs/exfaust1/exfaust1.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

## Comb

`Comb` est un instrument pour Gramophone très simple basé sur un filtre en peigne. Les [capteurs de mouvements](about.md#les-capteurs-de-mouvements) du Gramophone contrôlent le volume et la hauteur du son produit. Le [potentiomètre assignable](about.md#le-potentiometre-assignable) contrôle l'agressivité et la résonance du son. Le [bouton assignable](about.md#le-bouton-assignable) permet d'activer la production du son.

<!-- faust-run -->
<div class="faust-run"><img src="exfaust2/exfaust2.svg" class="mx-auto d-block">
~~~

import("stdfaust.lib");

// parameters
gate = button("gate[switch:1]");
gain = hslider("gain[acc: 0 1 -10 0 10]",0.5,0,1,0.01)^2;
del = hslider("del[acc: 1 0 -10 0 10]",525,50,1000,1) : si.smoo;
fb = hslider("fb[knob:2]",0.7,0.5,1,0.001);

process = no.noise*gate*gain : fi.fb_fcomb(1024,del,1,fb); 

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/gramophone/programs/exfaust2/exfaust2.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

## FM

`FM` est un instrument pour Gramophone basé sur un synthétiseur FM (modulation de fréquence). Le [bouton assignable](about.md#le-bouton-assignable) peut être utilisé comme un interrupter pour activer et désactiver le son. La hauteur du son produit peut être contrôlée avec le [potentiomètre assignable](about.md#le-potentiometre-assignable). Les [capteurs de mouvements](about.md#les-capteurs-de-mouvements) du Gramophone permettent de contrôler le timbre du son.

<!-- faust-run -->
<div class="faust-run"><img src="exfaust3/exfaust3.svg" class="mx-auto d-block">
~~~

import("stdfaust.lib");

// parameters
gate = checkbox("gate[switch:1]") : si.smoo;
freq0 = hslider("freq0[knob:2]",200,50,500,0.01) : si.smoo;
ratio1 = hslider("ratio1[acc: 0 1 -10 0 10]",1.5,1,2,0.01) : si.smoo;
ratio2 = hslider("ratio2[acc: 1 0 -10 0 10]",1.5,1,2,0.01) : si.smoo;
index1 = hslider("index1[acc: 1 1 -10 0 10]",500,0,1000,0.01) : si.smoo;
index2 = hslider("index2[knob:3]",500,0,1000,0.01) : si.smoo;

// mappings
freq1 = freq0*ratio1;
freq2 = freq1*ratio2;

process = sy.fm((freq0,freq1,freq2),(index1,index2))*gate; 

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/gramophone/programs/exfaust3/exfaust3.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

## Brass

`Brass` est un instrument pour Gramophone basé sur un synthétiseur de trompette (modèle physique). Le [bouton assignable](about.md#le-bouton-assignable) permet d'activer le souffle. Le [potentiomètre assignable](about.md#le-potentiometre-assignable) contrôle la distortion du son et peut être utilisé pour augmenter le gain de l'instrument. Les autres paramètres du modèle sont contrôlés par les [capteurs de mouvements](about.md#les-capteurs-de-mouvements).

<!-- faust-run -->
<div class="faust-run"><img src="exfaust4/exfaust4.svg" class="mx-auto d-block">
~~~

import("stdfaust.lib");

// parameters
gate = checkbox("gate[switch:1]");
p = hslider("p[acc: 0 1 -10 0 10]",0.5,0,1,0.01) : si.smoo;
lips = hslider("lips[acc: 2 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;
tube = hslider("note[acc: 1 0 -10 0 10]",60,40,70,3) : ba.midikey2hz : pm.f2l;
dist = hslider("dist[knob:2]",0,0,1,0.01) : si.smoo;

// mappings
pres = gate*p;

process = pm.brassModel(tube,lips,0,pres) : ef.cubicnl(dist,0)*0.95; 

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/gramophone/programs/exfaust4/exfaust4.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->
