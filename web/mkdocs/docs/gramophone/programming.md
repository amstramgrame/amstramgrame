# Programmer le Gramophone

Dans ce court tutoriel, nous montrons comment programmer le Gramophone avec le [Faust Web IDE](../faust/ide.md) et le [Faust Playground](../faust/playground.md). 

## Avec le Faust Web IDE

**Avant de débuter ce tutoriel, il est recommandé de lire [la page sur le Faust Web IDE](../faust/ide.md)**.

Prenons un programme Faust très simple qui produit une onde en dent de scie :

<!-- faust-run -->
<div class="faust-run">
~~~
import("stdfaust.lib");
freq = 440;
process = os.sawtooth(freq);
~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/gramophone/programming/exfaust0/exfaust0.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

Clique sur le bouton "Éditer/exécuter le programme" pour ouvrir le programme ci-dessus dans le Faust Web IDE. Il peut alors être exécuté directement dans le navigateur Web en suivant la procédure indiquée [ici](../faust/ide.md). 

Pour charger ce programme sur le Gramophone, il suffit de cliquer dans un premier temps sur le bouton "Gramo" dans l'IDE :

<figure>
<img src="img/ide-gramo.svg" class="mx-auto d-block" width="100%">
</figure>

Cela lance la "fabrication" du programme et après un quinzaine de seconde, il devrait être automatiquement téléchargé sur ton ordinateur sous la forme d'un fichier appelé `binary.zip`. Si le téléchargement ne se lance pas, il est possible que ce dernier soit bloqué par ton navigateur Web. 

Une fois que `binary.zip` est téléchargé, connecte le Gramophone à ton ordinateur puis lance [l'application GramoLoader](loader.md). Assure-toi que [ton Gramophone est en "mode programmation"](about.md#mode-programmation) (l'interrupteur de mise en route du Gramophone doit-être placé à gauche). Ensuite, sélectionne le fichier `binary.zip` sur l'ordinateur en cliquant sur le bouton "Sélectionner un fichier" :

<figure>
<img src="img/loader.jpg" class="mx-auto d-block" width="50%">
</figure>

Le programme devrait alors être envoyé sur le Gramophone. Cette opération prend généralement une quinzaine de secondes. 

Si tout s'est bien passé, le Gramophone devrait être prêt à exécuter le programme. Pour cela, il suffit de [mettre le Gramophone en "mode neutre"](about.md#mode-neutre) en plaçant l'interrupteur de démarrage à droite et en pressant ensuite brièvement [la mollette de sélection des programmes Faust](about.md#passer-dun-programme-a-lautre) une fois. Un son correspondant à l'onde en dent de scie implémentée lors de l'étape précédente devrait alors être émis. Le volume du son produit peut être contrôlé avec [le potentiomètre de contrôle du volume du Gramophone](#controle-du-volume).

**Pour modifier le programme, il suffit de changer le code dans le Faust Web IDE et de rappuyer sur le bouton "Gramo" : rien d'autre à faire, l'application GramoLoader se charge de tout !**

Comme le programme Faust présenté au début de cette section ne contient aucun paramètre, il n'est actuellement pas possible d’interagir avec ce dernier. Pour apprendre à contrôler un programme Faust avec le Gramophone, tu peux maintenant lire le scenario : [Hello World : mon premier programme pour Gramophone](../scenari/hello-world.md).

Une fois installé sur le Gramophone, le programme peut être également utilisé en [mode batterie](about.md#mode-batterie).

## Avec le Faust Playground

**Avant de débuter ce tutoriel, il est recommandé de lire [la page sur le Faust Playground](../faust/playground.md)**.

Construisons tout d'abord un programme très simple dans le [Faust Playground](https://faustplayground.grame.fr/) en connectant par exemple une harpe "Kisana" (instrument) à un Echo (effet) :

<figure>
<img src="img/playground-kis-echo.jpg" class="mx-auto d-block" width="100%">
</figure>

Du son devrait être produit en déplaçant les potentiomètres "1 (Note 48)", "2 (Note 60)" ou "3 (Note 72)" de Kisana. 

Pour installer ce programme sur le Gramophone, il faut dans un premier temps cliquer sur le bouton "EXPORT" dans le menu en haut de la fenêtre :

<figure>
<img src="img/playground-export.svg" class="mx-auto d-block" width="100%">
</figure>

puis sur le bouton "+ d'options" :

<figure>
<img src="img/playground-export-options.svg" class="mx-auto d-block" width="100%">
</figure>

Dans les menus qui s'affichent, sélectionne "esp32" dans le menu du haut et "gramophoneFlash" dans le deuxième, puis clique sur le bouton "Export" :

<figure>
<img src="img/playground-export-select.svg" class="mx-auto d-block" width="100%">
</figure>

Après un quinzaine de secondes, un bouton "Download" devrait s'afficher dans le menu de gauche, clique dessus pour télécharger le fichier `binary.zip` contenant le programme du Gramophone sur ton ordinateur :

<figure>
<img src="img/playground-export-download.svg" class="mx-auto d-block" width="100%">
</figure>

Une fois que `binary.zip` est téléchargé, connecte le Gramophone à ton ordinateur puis lance [l'application GramoLoader](loader.md). Assure-toi que [ton Gramophone est en "mode programmation"](about.md#demarrage-du-gramophone) (l'interrupteur de mise en route du Gramophone doit-être placé à gauche). Ensuite, sélectionne le fichier `binary.zip` sur l'ordinateur en cliquant sur le bouton "Sélectionner un fichier" :

<figure>
<img src="img/loader.jpg" class="mx-auto d-block" width="50%">
</figure>

Le programme devrait alors être envoyé sur le Gramophone. Cette opération prend généralement une quinzaine de secondes. 

Si tout s'est bien passé, le Gramophone devrait être prêt à exécuter le programme. Pour cela, il suffit de [mettre le Gramophone en mode neutre](about.md#mode-neutre) en plaçant l'interrupteur de démarrage à droite et en pressant ensuite brièvement [la mollette de sélection des programmes Faust](about.md#passer-dun-programme-a-lautre) une fois. Un son correspondant au programme créé dans le Faust Playground lors de l'étape précédente devrait alors être émis.

**Pour modifier le programme, il suffit de changer le patch dans le Faust Playground et de re-générer une fichier `binary.zip` : rien d'autre à faire, l'application GramoLoader se charge de tout !**  

Une fois installé sur le Gramophone, le programme peut être également utilisé en [mode batterie](about.md#mode-batterie). 
