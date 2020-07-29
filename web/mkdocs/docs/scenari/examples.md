# Visite guidée des exemples de programme de Gramophone

Le but de ce scenario est d'expliquer le fonctionnement de certains des programmes pour Gramophones disponibles sur ce site dans [Le Gramophone/Programmes Faust pour Gramophone](../gramophone/programs.md). 

## TicTac

Pour rappel, le programme [TicTac](../gramophone/programs.md#tictac) prend la forme suivante :

<!-- faust-run -->
<div class="faust-run"><img src="exfaust0/exfaust0.svg" class="mx-auto d-block">
~~~

import("stdfaust.lib");

// parameters
impFreq = hslider("impFreq[acc: 1 0 -10 0 10]",11,2,20,0.01) : si.smoo;
resFreq = hslider("resFreq[acc: 0 1 -10 0 10]",1650,300,3000,0.01) : si.smoo;
distDrive = hslider("distDrive[knob:2]",0,0,1,0.01) : si.smoo;
q = hslider("q[knob:3]",30,10,50,0.01) : si.smoo;
del = hslider("del[acc: 0 1 -10 0 10]",0.2,0,0.4,0.01) : si.smoo;
fb = hslider("fb[acc: 1 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;
gate = button("gate[switch:1]");

// DSP
process = os.lf_imptrain(impFreq)*gate  : fi.resonlp(resFreq,q,1) : ef.echo(0.4,del,fb) : 
ef.cubicnl(distDrive,0)*0.95;

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/scenari/examples/exfaust0/exfaust0.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

La dernière ligne `process` assemble les différents éléments de production du son. `os.lf_imptrain` produit des clics à intervalles réguliers (à une fréquence de `impFreq`). Essaye ce programme dans le Faust Web IDE pour entendre le son produit par cette fonction :

<!-- faust-run -->
<div class="faust-run"><img src="exfaust1/exfaust1.svg" class="mx-auto d-block">
~~~

import("stdfaust.lib");
impFreq = hslider("impFreq",11,2,20,0.01) : si.smoo;
process = os.lf_imptrain(impFreq);

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/scenari/examples/exfaust1/exfaust1.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

`fi.resonlp` est un filtre qui permet d'appliquer une hauteur aux clics produits par `os.lf_imptrain`. La hauteur des sons produits est déterminée par la fréquence `resFreq` du filtre. Le paramètre `q` du filtre détermine son "agressivité". Essaye ce programme dans le Faust Web IDE pour entendre l'effet de `fi.resonlp` sur `os.lf_imptrain` :

<!-- faust-run -->
<div class="faust-run"><img src="exfaust2/exfaust2.svg" class="mx-auto d-block">
~~~

import("stdfaust.lib");
impFreq = hslider("impFreq",11,2,20,0.01) : si.smoo;
resFreq = hslider("resFreq",1650,300,3000,0.01) : si.smoo;
q = hslider("q[knob:3]",30,10,50,0.01) : si.smoo;
process = os.lf_imptrain(impFreq) : fi.resonlp(resFreq,q,1);

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/scenari/examples/exfaust2/exfaust2.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->
 
`ef.echo` est un écho  
 
