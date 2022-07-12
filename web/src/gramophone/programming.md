# Programmer le Gramophone

Dans ce court tutoriel, nous montrons comment programmer le Gramophone avec le [Faust Web IDE](../faust/ide.md) et le [Faust Playground](../faust/playground.md). 

## Avec le Faust Web IDE

**Avant de débuter ce tutoriel, il est recommandé de lire [la page sur le Faust Web IDE](../faust/ide.md)**.

Prenons un programme Faust très simple qui produit une onde en dent de scie :

<!-- faust-run -->
import("stdfaust.lib");
freq = 440;
process = os.sawtooth(freq);
<!-- /faust-run -->

Il est important de se rappeler d'autoriser l'accès au microphone de l'ordinateur quand le Faust Web IDE le demande. Sans cela, il ne fonctionnera pas.

Clique sur le bouton "Éditer/exécuter le programme" pour ouvrir le programme ci-dessus dans le Faust Web IDE. Il peut alors être exécuté directement dans le navigateur web en suivant la procédure indiquée [ici](../faust/ide.md). 

Pour charger ce programme sur le Gramophone, il suffit de cliquer dans un premier temps sur le bouton "Gramo" dans l'IDE :

<figure>
<img src="img/ide-gramo.svg" class="mx-auto d-block" width="100%">
</figure>

Cela lance la "fabrication" du programme et après une quinzaine de secondes, il devrait être automatiquement téléchargé sur ton ordinateur sous la forme d'un fichier appelé `binary.zip`. Si le téléchargement ne se lance pas, il est possible que ce dernier soit bloqué par ton navigateur web. 

Une fois que `binary.zip` est téléchargé, connecte le Gramophone à ton ordinateur puis lance [l'application GramoLoader](loader.md). Assure-toi que [ton Gramophone est en "mode neutre"](about.md#mode-neutre) (position centrale). Ensuite, sélectionne le fichier `binary.zip` sur l'ordinateur en cliquant sur le bouton "Sélectionner un fichier" :

<figure>
<img src="img/loader.jpg" class="mx-auto d-block" width="50%">
</figure>

Le programme devrait alors être envoyé sur le Gramophone. Cette opération prend généralement une quinzaine de secondes. 

Si tout s'est bien passé, le Gramophone devrait être prêt à exécuter le programme. Pour cela, il suffit de [mettre le Gramophone en "mode neutre"](about.md#mode-neutre) en plaçant l'interrupteur de démarrage à droite et en pressant ensuite brièvement la mollette plate une fois. Un son correspondant à l'onde en dent de scie implémentée lors de l'étape précédente devrait alors être émis. Le volume du son produit peut être contrôlé avec [le potentiomètre de contrôle du volume du Gramophone](#controle-du-volume).

**Pour modifier le programme, il suffit de changer le code dans le Faust Web IDE et de rappuyer sur le bouton "Gramo" : rien d'autre à faire, l'application GramoLoader se charge de tout !**

Comme le programme Faust présenté au début de cette section ne contient aucun paramètre, il n'est actuellement pas possible d’interagir avec ce dernier. Pour apprendre à contrôler un programme Faust avec le Gramophone, tu peux maintenant lire le scenario : [Hello World : mon premier programme pour Gramophone](../scenari/hello-world.md).

Une fois installé sur le Gramophone, le programme peut être également utilisé en [mode batterie](about.md#mode-batterie).

## Avec le Faust Playground

Le Faust PlayGround est une version simplifiée du Faust Web IDE, destinée aux débutants de la programmation informatique. Ici, la programmation ne se fait pas en écrivant des lignes de code, mais en connectant différents blocs. Plusieurs onglets sont disponibles pour créer un programme chargeable sur un Gramophone. Faisons un tour des onglets et fonctionnalités disponibles sur le Faust PlayGround.

**Note :** Comme pour le Faust Web IDE, quand le Faust PlayGround demande l'accès au microphone de l'ordinateur, il faut l'autoriser, sinon cela ne fonctionnera pas.

**Le premier onglet, Library** (bibliothèque en anglais) donne accès à des instruments programmés à l'avance (colonne "Instruments"). Il donne également accès à des effets sonore qui peuvent être connectés aux instruments (colonne "Effects"). Enfin, dans la colonne "Examples", sont disponibles des combinaisons d'instruments et d'effets préconçues.

Pour créer un programme, sélectionne un instrument de la bibliothèque et glisse-le dans l'espace bleu, le "PlayGround". Ici, nous avons choisi un des plus simples, `SOscillator`. Ce programme génère une onde sinusoïdale simple, dont la fréquence (la hauteur) peut être modifiée. Lorsque le bloc est chargé dans le PlayGround, il ne produit pas de son. Pour l'activer, cliquer sur le point rouge du bloc `SOscillator` et glisse ta souris jusqu'au point vert à droite de l'écran, lié au bloc "haut-parleur". Ton programme produit maintenant un son, et tu peux modifier sa fréquence en temps réel en déplaçant le curseur rouge en dessous de "Frequency" ! Lorsque tu souhaites désactiver le son, clique sur la ligne qui relie ton instrument au haut-parleur, cela le coupera.

Ajoutons maintenant un effet à notre programme. Pour cela, sélectionne un effet dans la colonne "Effects" et glisse-le dans le Playground. Ici nous choisissons l'effet "Volume". On a donc maintenant deux blocs sur le PlayGround. Connecte d’abord l'instrument et l’effet (du point rouge de l'instrument jusqu'au point vert de l'effet), puis connecte l'effet au haut-parleur. Maintenant, le programme produit du son et tu peux aussi modifier son
volume en direct en déplaçant le curseur de l'effet.

Si tu as déjà des bases en programmation Faust, tu peux changer les blocs en mode "lignes de code" pour les modifier en détail. Pour cela, l'icône de crayon en bas à gauche de chaque bloc te permet d'accéder aux lignes de
codes utilisées dans ce bloc. Tu peux par exemple modifier les variables des programmes (comme la fréquence de l’Oscillator) ou les métadata associées à des effets. Par exemple, on peut décider que la fréquence ne sera pas
contrôlée par l’accéléromètre du Gramophone (signifié par le [acc:…] dans le code) mais par le potentiomètre assignable (signifié par un [knob:2]) dans le code.

**Le deuxième onglet, Load** (charger en anglais) permet de charger un programme déjà existant dans le FaustPlayGround. Le fichier doit être en format `.dsp` ou `.jfaust` pour que cela fonctionne.

**Le troisième onglet, Edit** (éditer en anglais) permet de modifier plus précisément les blocs sans passer par les lignes de code.

**Le quatrième onglet, Save** (sauvergarder en anglais) permet de sauvegarder un programme Playground sur lequel tu es en train de travailler. Une fois sauvegardé, un fichier `.jfaust` est créé. Tu peux ensuite recharger ton
programme Playground grâce à l'onglet Load et en selectionnant le fichier `.jfaust`.

**Le cinquième onglet, Export** (exporter en anglais) permet de générer un fichier que tu pourras charger ensuite sur le Gramophone. Pour cela, clique sur "+ plus d'options" au centre de l'onglet. Pour que ton fichier soit exportable sur un Gramophone, il faut sélectionner "esp32" pour la première option en dessous de "Rafraîchir le serveur". Pour la deuxième option, il faut choisir "gramophoneFlash". Tu peux ensuite cliquer sur "Exporter".

Si tout s'est bien déroulé, à droite de l'onglet devrait apparaître un QR Code et un bouton "Télécharger". Clique sur ce bouton pour générer un fichier `binary.zip`, que tu pourras utiliser avec le Gramoloader !

<!-- (ancienne version)
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

Après une quinzaine de secondes, un bouton "Download" devrait s'afficher dans le menu de gauche, clique dessus pour télécharger le fichier `binary.zip` contenant le programme du Gramophone sur ton ordinateur :

<figure>
<img src="img/playground-export-download.svg" class="mx-auto d-block" width="100%">
</figure>

Une fois que `binary.zip` est téléchargé, connecte le Gramophone à ton ordinateur puis lance [l'application GramoLoader](loader.md). Assure-toi que [ton Gramophone est en "mode programmation"](about.md#demarrage-du-gramophone) (l'interrupteur de mise en route du Gramophone doit être placé à gauche). Ensuite, sélectionne le fichier `binary.zip` sur l'ordinateur en cliquant sur le bouton "Sélectionner un fichier" :

<figure>
<img src="img/loader.jpg" class="mx-auto d-block" width="50%">
</figure>

Le programme devrait alors être envoyé sur le Gramophone. Cette opération prend généralement une quinzaine de secondes. 

Si tout s'est bien passé, le Gramophone devrait être prêt à exécuter le programme. Pour cela, il suffit de [mettre le Gramophone en mode neutre](about.md#mode-neutre) en plaçant l'interrupteur de démarrage à droite et en pressant ensuite brièvement [la mollette de sélection des programmes Faust](about.md#passer-dun-programme-a-lautre) une fois. Un son correspondant au programme créé dans le Faust Playground lors de l'étape précédente devrait alors être émis.

**Pour modifier le programme, il suffit de changer le patch dans le Faust Playground et de re-générer un fichier `binary.zip` : rien d'autre à faire, l'application GramoLoader se charge de tout !**  

Une fois installé sur le Gramophone, le programme peut être également utilisé en [mode batterie](about.md#mode-batterie). 

-->
