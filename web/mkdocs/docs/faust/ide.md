# Le Faust Web IDE

Le [Faust Web IDE](https://faustide.grame.fr/?mode=amstram) (accessible sur <https://faustide.grame.fr>) est un outil en ligne permettant d'écrire des programmes Faust, de les tester directement dans le navigateur web, puis de les exporter sur le [Gramophone](../gramophone/about.md) via l'application [GramoLoader](../gramophone/loader.md). Le terme IDE vient de l'anglais et est l'abréviation de "Integrated Development Environment" (soit "environnement de développement intégré" en français). C'est un standard dans le domaine de l'informatique pour désigner un outil facilitant l'utilisation d'un langage de programmation. 

## Lancer le Faust Web IDE

Bien que le Faust Web IDE soit compatible avec la plupart des navigateurs web, il est fortement recommandé d'utiliser Google Chrome ou Mozilla Firefox. Dans le cas où [MIDI](https://fr.wikipedia.org/wiki/Musical_Instrument_Digital_Interface) serait nécessaire pour le programme Faust, seul Google Chrome fonctionnera (la norme MIDI n'étant pas supportée dans Firefox).

Trois versions du Faust Web IDE sont disponibles pour les utilisateurs du projet Amstramgrame :

* La version "simplifiée spéciale Amstramgrame" (pour les élèves) : <https://faustide.grame.fr/?mode=amstram>
* La version "avancée spéciale Amstramgrame" (pour les enseignants) : <https://faustide.grame.fr/?mode=amstram-pro>
* La version "standard" : <https://faustide.grame.fr>

La [version simplifiée](<https://faustide.grame.fr/?mode=amstram>) satisfera les besoins de la plupart des utilisateurs du Gramophone.

Lorsque le Faust Web IDE est ouvert pour la première fois, il demande d'avoir accès au micro intégré de la machine : il est important d’accepter cette demande. Une fois ouvert, un programme Faust par défaut implémentant un djembé devrait s'afficher :

<figure>
<img src="img/ide-default.jpg" class="mx-auto d-block" width="100%">
</figure>

Le menu de gauche permet d'accéder aux différentes fonctions du Faust Web IDE (ex. exécuter le programme dans le navigateur, exporter le programme vers le Gramophone, etc.) :

<figure>
<img src="img/ide-menu.jpg" class="mx-auto d-block" width="100%">
</figure>

La zone d'édition de texte permet d'écrire le programme Faust :

<figure>
<img src="img/ide-code.jpg" class="mx-auto d-block" width="100%">
</figure>

La zone en dessous de l'éditeur de code affiche le diagramme ou l'interface utilisateur correspond au programme Faust si ce dernier est exécuté :

<figure>
<img src="img/ide-diagram.jpg" class="mx-auto d-block" width="100%">
</figure>

Notez que le Faust Web IDE est en anglais. La programmation informatique étant généralement effectuée dans cette langue, le Faust Web IDE ne déroge pas à cette règle :). 

## Produire du son

Pour exécuter le programme par défaut, il suffit de cliquer sur le bouton "Run" dans le menu de gauche :

<figure>
<img src="img/ide-run.jpg" class="mx-auto d-block" width="100%">
</figure>

La fenêtre qui s'ouvre et remplace le diagramme correspond à l'interface utilisateur du programme Faust exécuté. Fermer cette fenêtre en cliquant sur la croix à côté de DSP permet d'arrêter le programme et donc de couper le son :

<figure>
<img src="img/ide-close.jpg" class="mx-auto d-block" width="100%">
</figure>

## Utiliser les exemples du site Amstramgrame

Les différents tutoriels et scénarii sur le site d'Amstramgrame contiennent des dizaines d'exemples de programmes prêts à être utilisés dans le Faust Web IDE et dans certains cas exécutés sur le Gramophone. Ils se présentent de la manière suivante :

<!-- faust-run -->
<div class="faust-run">
~~~
import("stdfaust.lib");
process = no.noise;
~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/faust/ide/exfaust0/exfaust0.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

D'abord on peut voir le digramme correspondant au programme Faust présenté en dessous. Le bouton "Éditer/exécuter le programme" permet d'ouvrir l'exemple directement dans le Faust Web IDE. Essaye pour voir ! Une fois ouvert dans l'IDE, les programmes d'exemples peuvent être utilisés comme n'importe quel autre programme Faust.

## Exporter un programme vers le Gramophone

Tout programme écrit et fonctionnant dans le Faust Web IDE peut être envoyé vers le Gramophone connecté à l'ordinateur. [**La page "Programmer le Gramophone"**](../gramophone/programming.md) donne la marche à suivre.

## Autres fonctionnalités

Plusieurs programmes peuvent être ouverts dans le Faust Web IDE en même temps. Pour créer un nouveau programme vide, il suffit de cliquer sur le bouton en haut à gauche :

<figure>
<img src="img/ide-new-program.jpg" class="mx-auto d-block" width="100%">
</figure>

Avant de pouvoir exécuter ce nouveau programme, il est nécessaire de le sélectionner :

<figure>
<img src="img/ide-run-new-program.jpg" class="mx-auto d-block" width="100%">
</figure>

À noter que l'onglet "Exemples" au-dessus de la zone d'édition du code donne accès à des dizaines d'exemples de programme Faust. De la même manière, n'importe quel programme Faust disponible en local sur la machine peut être "glissé" dans le Faust Web IDE. 

D'autre fonctionnalités sont accessibles dans le menu de gauche du Faust Web IDE. N'hésitez pas à les découvrir par vous-même :). 
