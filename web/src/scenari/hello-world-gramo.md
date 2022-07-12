# Hello World sur le Gramophone

Dans le scénario précédent ([Hello World : mon premier programme Faust](hello-world.md)), un programme Faust très simple produisant un son pur a été implémenté. Le [Faust Web IDE](../faust/ide.md) nous a servi d'atelier/d'établi pour prototyper le son de notre futur instrument. 

Dans ce nouveau scénario, nous allons apprendre à transférer un programme écrit dans le Faust Web IDE vers le [Gramophone](../gramophone/about.md). Nous verrons aussi comment certains des capteurs (ex. boutons, potentiomètres, etc.) du Gramophone peuvent être utilisés pour contrôler le son produit.

À la fin de ce scénario, tu auras créé ton premier instrument sur le Gramophone !

## Exporter un programme Faust vers le Gramophone

Il est très simple d'exporter un programme Faust protytpé dans le [Faust Web IDE](../faust/ide.md). Pour cela, il suffit d'installer [le GramoLoader](../gramophone/loader.md) sur ta machine puis de le lancer :

<figure>
<img src="img/loader.jpg" class="mx-auto d-block" width="50%">
</figure>

Reprenons le programme écrit dans [Hello World : mon premier programme Faust](hello-world.md) implémentant une onde sinusoïdale contrôlée par un bouton et un potentiomètre :

<!-- faust-run -->
```
import("stdfaust.lib");
on = button("on-off");
freq = hslider("frequence",440,20,3000,1);
process = os.osc(freq)*on;
``` 
<!-- /faust-run -->

Pour l'instant, supprimons le bouton car il bloquera le son au démarrage du Gramophone : 

<!-- faust-run -->
```
import("stdfaust.lib");
freq = hslider("frequence",440,20,3000,1);
process = os.osc(freq);
``` 
<!-- /faust-run -->

Dans le Faust Web IDE, clique sur le bouton Gramo :

<figure>
<img src="img/ide-gramo.jpg" class="mx-auto d-block" width="100%">
</figure>

Une roue devrait se mettre à tourner à gauche du bouton. Cette opération prend généralement une quinzaine de secondes (pas besoin de rappuyer sur le bouton, ça n'ira pas plus vite, il faut être patient). 

Une fois terminé, le téléchargement d'un fichier appelé `binary.zip` devrait être lancé, rappelle-toi de l'emplacement dans lequel tu décides de l'enregistrer. 

Branche le Gramophone avec son câble USB à l'ordinateur :

<figure>
<img src="img/gramo-usb.jpg" class="mx-auto d-block" width="70%">
</figure>

puis mets le [en mode programmation](../gramophone/about.md#mode-programmation) en plaçant l'interrupteur de démarrage à gauche :

<figure>
<img src="img/gramo-prog.jpg" class="mx-auto d-block" width="70%">
</figure>

Dans l'application GramoLoader, clique sur le bouton "Sélectionner un fichier". Sélectionne le fichier `binary.zip` téléchargé lors de l'opération précédente, la programmation du Gramophone devrait être lancée et le message suivant devrait s'afficher : "Programmation du Gramophone en cours". 

Si tout se passe bien, l'application GramoLoader devrait afficher le message : "Programmation terminée, en attente d'un nouveau fichier" au bout d'une quinzaine de secondes. 

Pour lancer le programme Faust sur le Gramophone, mets le [en mode neutre](../gramophone/about.md#mode-neutre) en plaçant le bouton de démarrage au centre :

<figure>
<img src="img/gramo-lauch.jpg" class="mx-auto d-block" width="70%">
</figure>

Le Gramophone devrait se mettre à produire une sinusoïde (le même son que dans le Faust Web IDE) ! Si aucun son n'est produit, vérifie que le volume du Gramophone n'est pas à 0 en bougeant [le potentiomètre à côté du bouton de démarrage](../gramophone/about.md#controle-du-volume) :

<figure>
<img src="img/gramo-volume.jpg" class="mx-auto d-block" width="70%">
</figure>

Le son produit peut vite devenir ennuyeux puisqu'il n'est pas contrôlable pour le moment. Pour ne plus l'entendre, n'hésites pas à baisser le volume du son au minimum.  

## Contrôler le son avec le Gramophone

Le Gramophone produit donc maintenant un son. Toutefois, pour qu'il devienne un "vrai" instrument de musique, il est nécessaire de pouvoir contrôler ce son. Pour mener à bien cette tâche, le Gramophone donne accès à toute une panoplie de capteurs : 

* un [bouton](../gramophone/about.md#le-bouton-assignable) ;
* un [potentiomètre](../gramophone/about.md#le-potentiometre-assignable) ;
* un [capteur de lumière](../gramophone/about.md#la-photoresistance) ;
* des [capteurs de mouvements](../gramophone/about.md#les-capteurs-de-mouvements) (accéléromètre et gyroscope).

qui peuvent être liés à des paramètres d'un programme Faust depuis le code.  

Le paramètre le plus fondamental d'un instrument de musique est de pouvoir contrôler le fait qu'un son est produit ou non (ex. quand on souffle dans une flûte, quand on appuie sur la touche d'un clavier, etc.). Actuellement, le programme Faust installé sur le Gramophone produit du son de manière continue. Essayons d'utiliser [le bouton placé dans la partie supérieure du Gramophone](../gramophone/about.md#le-bouton-assignable) :
 
<figure>
<img src="img/gramo-button.jpg" class="mx-auto d-block" width="80%">
</figure>

pour activer le son lorsque l'on appuie dessus. Pour cela, il est nécessaire d'utiliser une "[métadata](../gramophone/about.md#metadatas-de-programmation-du-gramophone)" dans le nom du paramètre du programme Faust permettant d'activer et de déactiver le son. La métadata correspondant au bouton assignable du Gramophone est : `[switch:1]`. Il suffit de placer cette dernière dans le nom du paramètre du programme Faust à contrôler :

```
on = button("on-off[switch:1]");
``` 

Ainsi, lorsque le bouton sur le Gramophone sera pressé, `on` sera égal à 1 et lorsqu'il ne sera pas pressé il sera égal à 0 !

De la même manière, il est possible d'assigner le paramètre fréquence de notre programme Hello Word [au potentiomètre à côté du bouton](../gramophone/about.md#le-potentiometre-assignable) :

<figure>
<img src="img/gramo-pot.jpg" class="mx-auto d-block" width="80%">
</figure>

en utilisant la [métadata `[knob:2]`](../gramophone/about.md#le-potentiometre-assignable) dans la déclaration du nom du paramètre `frequence` : 

```
freq = hslider("frequence[knob:2]",440,20,3000,1);
```

Ton programme Faust devrait maintenant avoir la forme suivante :

<!-- faust-run -->
```
import("stdfaust.lib");
on = button("on-off[switch:1]");
freq = hslider("frequence[knob:2]",440,20,3000,1);
process = os.osc(freq)*on;
``` 
<!-- /faust-run -->

Assure-toi que ton Gramophone est en mode programmation puis installe cette nouvelle version du programme Faust sur ton Gramophone simplement en appuyant sur le bouton "Gramo" dans le Faust Web IDE. **Rien à faire du côté de l'application GramoLoader cette fois-ci à condition que tu enregistres le fichier `binary.zip` au même endroit que la dernière fois**. Au bout d'une trentaine de secondes (et oui, lorsque l'on programme il faut être patient :) ), l'application GramoLoader devrait afficher "Programmation terminée". 

Mets maintenant ton Gramophone en [mode neutre](../gramophone/about.md#mode-neutre) pour lancer le programme. Appuie sur le bouton en haut du Gramophone et essaye de tourner le potentiomètre assignable en même temps. Si aucun son n'est produit, assure-toi que le potentiomètre de contrôle du volume du son n'est pas à 0.

Maintenant amuse-toi bien et casse les oreilles de ton prof.  

## Faire fonctionner le Gramophone en mode batterie

Le Gramophone n'a pas été conçu pour être tout le temps connecté à un ordinateur mais bien pour être utilisé comme un instrument de musique en concert. Pour utiliser le Gramophone en [mode batterie](../gramophone/about.md#mode-neutre), il suffit de déconnecter le câble USB et de pousser l'interrupteur de démarrage vers la droite. Pour lancer le programme, il faut alors appuyer sur le gros bouton noir à côté de l’interrupteur de démarrage une ou deux fois :

<figure>
<img src="img/gramo-battery.jpg" class="mx-auto d-block" width="80%">
</figure>

Le Gramophone est prêt à être utilisé en [mode batterie](../gramophone/about.md#mode-batterie) !

N'oublie pas de remettre le Gramophone en [mode neutre](../gramophone/about.md#mode-neutre) une fois que tu as terminé de t'en servir pour ne pas que la batterie se décharge ! 

Pour en savoir plus sur les différents modes de fonctionnement du Gramophone, n'hésites pas à lire [cette section](../gramophone/about.md#demarrage-du-gramophone).  

## Tenir le Gramophone

Comme tout instrument de musique, le Gramophone ne se tient pas n'importe comment. Pour apprendre à tenir le Gramophone correctement, lis [cette section](../gramophone/about.md#tenir-le-gramophone).

## Exercice : contrôler la hauteur du son avec le capteur de lumière

Tous les capteurs du Gramophone peuvent être utilisés pour contrôler n'importe quel paramètre d'un programme Faust. Dans cet exercice, essaye de contrôler la hauteur (fréquence) du son produit avec le capteur de lumière du Gramophone plutôt que le potentiomètre. La métadata correspondant au capteur de lumière est : `[knob:3]`.

Le programme Faust correspondant devrait avoir la forme suivante :

<!-- faust-run -->
```
import("stdfaust.lib");
on = button("on-off[switch:1]");
freq = hslider("frequence[knob:3]",440,20,3000,1);
process = os.osc(freq)*on;
``` 
<!-- /faust-run -->
