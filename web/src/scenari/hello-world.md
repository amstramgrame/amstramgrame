# Hello World : mon premier programme pour Gramophone

Le but de ce scénario est d'écrire un programme Faust très simple et de le faire fonctionner sur ton Gramophone ! Tu apprendras donc à :

* produire du son avec Faust ;
* maîtriser la structure de base d'un programme Faust ;
* exporter un programme Faust vers [le Gramophone](../gramophone/about.md) depuis de la [Faust Web IDE](../faust/ide.md) ;
* assigner des boutons et des potentiomètres du Gramophone à différents paramètres du programme Faust.

## Produire du son avec Faust

Faust permet d’interagir directement avec le haut-parleur de notre ordinateur ou du Gramophone en décrivant le son produit avec du code. Dans le cas de Faust, le code peut être vue comme une succession de formules mathématiques connectées entres-elles. 

Pour qu'un haut-parleur produise un son, il est nécessaire de le faire vibrer c'est à dire que la position de sa membrane doit évoluer dans le temps. La manière la plus "standard" d'effectuer cette opération est d'envoyer une onde sinusoïde au haut-parleur. Le programme Faust suivant produit une onde sinusoïdale :

<!-- faust-run -->
```
import("stdfaust.lib");
process = os.osc(440);
``` 
<!-- /faust-run -->

Clique sur le bouton "Éditer/exécuter le programme" ci-dessus et ce programme Faust devrait être ouvert dans le [Faust Web IDE](../faust/ide.md).