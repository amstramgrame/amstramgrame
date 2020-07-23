# Hello World sur le Gramophone

Le but de ce scenario est de faire fonctionner le programme Faust implémenté dans [Hello World : mon premier programme Faust](hello-world.md) sur le [Gramophone](../gramophone/about.md). Tu apprendras donc à :

* exporter un programme Faust vers le Gramophone depuis de la [Faust Web IDE](../faust/ide.md) ;
* assigner des boutons et des potentiomètres du Gramophone à différents paramètres du programme Faust.

## Exporter un programme Faust vers le Gramophone

Il est très simple d'exporter un programme Faust protytpé dans le [Faust Web IDE](../faust/ide.md). Pour cela, il suffit d'installer [le GramoLoader](../gramophone/loader.md) sur ta machine puis de le lancer :

<figure>
<img src="img/loader.jpg" class="mx-auto d-block" width="50%">
</figure>

Reprenons le programme écrit dans [Hello World : mon premier programme Faust](hello-world.md) implémentant une onde sinusoïdale contrôlée par un bouton et un potentiomètre :

<!-- faust-run -->
<div class="faust-run"><img src="exfaust0/exfaust0.svg" class="mx-auto d-block">
~~~

import("stdfaust.lib");
on = button("on-off");
freq = hslider("frequence",440,20,3000,1);
process = os.osc(freq)*on;
 
~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/scenari/hello-world-gramo/exfaust0/exfaust0.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

Dans le Faust Web IDE, clique sur le bouton Gramo :

 
