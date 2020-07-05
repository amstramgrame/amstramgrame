# Le langage de programmation Faust

## Un monde de langages de programmation

À l'image des langages utilisés par les humains pour communiquer entre-eux comme le Français, l'Allemand, le Chinois, etc., il existe aujourd'hui des dizaines de langages de programmation informatique. Certains comme Python, Java ou JavaScript sont devenus des standards et sont connus d'un grand nombre de personnes, d'autres comme Assembleur ou VHDL s'adressent à un public d'utilisateur plus spécialisé. La plupart des langages de programmation grand-public sont dit à "usage général", c'est à dire qu'ils peuvent être utilisés pour construire n'importe quel type de programme pour tout types d'applications. À l'inverse, il existe des langages à usage spécifique qui ne peuvent être utilisé que pour effectuer un type de tâche donné. C'est le cas de Faust qui est placé au cœur d'AmStramGrame.

Faust a été spécialement conçu pour programmer (synthétiser) et manipuler (traiter) des sons. En effet, bien qu'il soit possible d'écrire (implémenter) des algorithmes pour la synthèse et le traitement du son dans des langages à usage général comme Python ou Java, ces derniers sont souvent trop peu performants pour produire du son de manière instantanée (en temps réel). Or, pour faire de la musique, il est nécessaire que les sons soient produits de manière immédiate. Il existe un langage à usage général qui permet de mener à bien cette tâche : C/C++. Toutefois, l'utilisation de ce dernier est réservée à des programmateurs chevronnés et nécessite des années de pratique. À l'inverse, Faust est simple d'utilisation et s'adresse à tous les publics.

## Faust, c'est quoi ?

En termes purement scientifiques, Faust est "un langage de programmation pour le traitement du signal en temps-réel". Dis autrement, c'est un langage fait pour programmer des sons et les produire de manière instantanée. Faust est issu d'une longue lignée de langage de programmation spécialement conçus pour le domaine de la musique (voir la [section correspondante](TODO)). Il peut être utilisé directement en ligne à travers la plateforme [Faust Web IDE](TODO) ([https://faustide.grame.fr](https://faustide.grame.fr)) ou en [l'installant sur sa machine](TODO) (cette option s'adresse à des programmateurs expérimentés).

Un programme Faust peut potentiellement être très court et ne faire que quelques lignes :

<!-- faust-run -->
<div class="faust-run"><img src="exfaust0/exfaust0.svg" class="mx-auto d-block">
~~~

import("stdfaust.lib");
freq = 440;
process = os.sawtooth(freq);
 
~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/tools/faust-lang/exfaust0/exfaust0.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

Pour tester ce programme, clique sur le bouton "Éditer/exécuter le programme". Le Faust Web IDE devrait alors s'ouvrir avec le code correspondant. Clique sur le bouton "Run" pour exécuter le code dans le Faust Web IDE (la page qui vient de s'ouvrir) : 

<img src="img/faust-run.jpg" class="mx-auto d-block" width="30%">

Un son devrait être produit !

## Petite histoire des langages de programmation pour la musique 