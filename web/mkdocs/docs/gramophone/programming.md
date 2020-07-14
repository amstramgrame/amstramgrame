# Programmer le Gramophone

Dans ce court tutoriel, nous montrons comment programmer le Gramophone avec le [Faust Web IDE](../faust/ide.md) et le [Faust Playground](../faust/playground.md). 

## Avec le Faust Web IDE

**Avant de débuter ce tutoriel, il est recommandé de lire [la page sur le Faust Web IDE](../faust/ide.md)**.

### Produire du son

Prenons un programme Faust très simple qui produit [une onde en dent de scie](TODO) :

<!-- faust-run -->
<div class="faust-run"><img src="exfaust0/exfaust0.svg" class="mx-auto d-block">
~~~
import("stdfaust.lib");
freq = 440;
process = os.sawtooth(freq);
~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/gramophone/programming/exfaust0/exfaust0.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

Clique sur le bouton "Éditer/exécuter le programme" pour ouvrir le programme ci-dessus dans le Faust Web IDE. Il peut alors être exécuté directement dans le navigateur Web en suivant la procédure indiquée [ici](TODO). 

Pour charger ce programme sur le Gramophone, il suffit de cliquer dans un premier temps sur le bouton "Gramo" dans l'IDE :

<figure>
<img src="img/ide-gramo.svg" class="mx-auto d-block" width="100%">
</figure>

Cela lance la "fabrication" du programme et après un quinzaine de seconde, il devrait être automatiquement téléchargé sur ton ordinateur sous la forme d'un fichier appelé `binary.zip`. Si le téléchargement ne se lance pas, il est possible que ce dernier soit bloqué par ton navigateur Web. 

Une fois que `binary.zip` est téléchargé, connecte le Gramophone à ton ordinateur puis lance [l'application GramoLoader](loader.md). Assure-toi que [ton Gramophone est en "mode programmation"](about.md#demarrage-du-gramophone) (l'interrupteur de mise en route du Gramophone doit-être placé à gauche). Ensuite, sélectionne le fichier `binary.zip` sur l'ordinateur en cliquant sur le bouton "Sélectionner un fichier" :

<figure>
<img src="img/loader.jpg" class="mx-auto d-block" width="50%">
</figure>

Le programme devrait alors être envoyé sur le Gramophone. Cette opération prend généralement une quinzaine de secondes. 

## Avec le Faust Playground
