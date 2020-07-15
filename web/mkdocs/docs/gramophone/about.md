# Le Gramophone

<figure>
<img src="img/gramo.jpg" class="mx-auto d-block" width="80%">
</figure>

Le Gramophone est un instrument de musique programmable développé à [Grame](http://www.grame.fr) dans le cadre du projet AmStramGrame. À l'instar des instruments de musique acoustiques "traditionnels" comme la trompette, le tabla ou le violon, il permet de produire du son, d'être contrôlé par un musicien et est complètement indépendant (il n'a pas besoin d'être branché avec un câble pour fonctionner). À l'inverse des instruments acoustiques, le son qu'il produit et son comportement sont complètement malléables et peuvent être décrits par la programmation informatique grâce au [langage Faust](../faust/about.md).  

<figure>
<img src="img/gramo-overview.svg" class="mx-auto d-block" width="60%">
<center><figcaption>Fonctionnement du Gramophone</figcaption></center>
</figure>

## Vue d'ensemble

Le Gramophone est composé d'une coque en plastique, d'un haut-parleur, d'un ordinateur embarqué, d'une batterie et de [capteurs (accéléromètre, gyroscope, boussole, boutons, potentiomètres et photorésistance)](TODO-tutorial). 

TODO: pics with components (bien parler de bouton assignable).

## Programmation du Gramophone

Le Gramophone se programme via un câble USB connecté à un ordinateur. Le [langage Faust](../faust/about.md) peut être utilisé pour programmer le Gramophone grâce aux plateformes [Faust Playground](../faust/playground.md) (programmation graphique pour les débutants) et [Faust Web IDE](../faust/ide.md) (programmation écrites/scriptées). Pour que cela fonctionne, il est nécessaire d'installer l'application [GramoLoader](loader.md) sur sa machine qui permet de faire le lien entre le navigateur Web et le gramophone.

<figure>
<img src="img/gramo-prog.svg" class="mx-auto d-block" width="90%">
<center><figcaption>Programmation du Gramophone</figcaption></center>
</figure>

Le tutoriel [Programmer le Gramophone](programming.md) donne plus détails sur la programmation du Gramophone.

## Fonctionnement du Gramophone

### Démarrage du Gramophone

Le Gramophone abrite un interrupteur qui permet de le démarrer et de l'arrêter. Cet interrupteur a trois positions pour sélectionner le mode de fonctionnement :

* en position centrale, le Gramophone est à l'arrêt ;
* lorsqu'il est enclenché à gauche, le Gramophone est démarré en "mode programmation" ;
* lorsqu'il est enclenché à droite, le Gramophone est démarré en "mode jeu" : il produit du son. 

TODO: pic of the switch

Le "mode programmation" doit être activé pour pouvoir programmer le Gramophone depuis le [Faust Web IDE](../faust/ide.md) ou le [Faust Playground](../faust/playground.md) via l'application [GramoLoader](loader.md).

Le "mode jeu" doit être sélectionné pour pouvoir executer les programmes installés sur le Gramophone. **Il est nécessaire de presser/appuyer sur [la molette de changement de programme](#passer-dun-programme-a-lautre) pour acter le lancement du premier programme Faust installé sur le Gramophone :**

<figure>
<img src="img/gramo-start.svg" class="mx-auto d-block" width="80%">
</figure>

### Tenir le Gramophone

Le Gramophone se tient dans la paume de la main droite avec la sangle autour de la main. Cette dernière peut être ajustée afin de tenir le Gramophone fermement. 

<figure>
<img src="img/gramo-holding1.jpg" class="mx-auto d-block" width="80%">
</figure>

Il est important de noter que la sangle n'est pas placée sur le Gramophone de manière symétrique : la photorésistance doit tomber sous le pouce et le bouton assignable sous le majeur :

<figure>
<img src="img/gramo-holding0.jpg" class="mx-auto d-block" width="80%">
</figure>

### Contrôle du volume

Le volume du son produit par le Gramophone peut être contrôlé par le potentiomètre se trouvant juste au-dessus de la prise jack (celui qui se trouve en bas de la main lorsque l'on tient le Gramophone) :

TODO: pic

> Il est important de noter que le volume du son produit dépend aussi fortement du programme exécuté sur le Gramophone.

### Contrôle des paramètres du son

Le son produit par le Gramophone peut-être contrôlé à l'aide de différents éléments d'interface. Chacun d'entre-eux peut être assigné directement dans un programme Faust à un paramètre du son à l'aide de [métadatas](TODO) (le fonctionnement des métadata dans Faust est détaillé dans TODO).

#### Le bouton assignable

Le bouton assignable du Gramophone se trouve à l'opposée du [potentiomètre de volume](#controle-du-volume) et tombe sous la majeur du musicien :

<figure>
<img src="img/gramo-button.svg" class="mx-auto d-block" width="80%">
</figure>

Il est adressable dans un programme Faust à l'aide de la métadata suivante : `[switch:1]`

#### Le potentiomètre assignable

La potentiomètre assignable du Gramophone se trouve juste à gauche du [bouton assignable](#bouton-assignable) :

<figure>
<img src="img/gramo-pot.svg" class="mx-auto d-block" width="80%">
</figure>

Il est "typiquement" actionné par la main gauche de l'instrumentiste.

Ce potentiomètre est adressable dans un programme Faust à l'aide de la métadata suivante : `[knob:3]`

#### La photorésistance

Le photorésistance assignable du Gramophone se trouve juste à gauche du [potentiomètre assignable](#potentiometre-assignable) et tombe sous le pouce de l'instrumentiste :

<figure>
<img src="img/gramo-photores.svg" class="mx-auto d-block" width="80%">
</figure>

Elle est adressable dans un programme Faust à l'aide de la métadata suivante : `TODO`.

#### Les capteurs de mouvements

TODO

### Charger le Gramophone

Pour charger la batterie du Gramophone, il suffit de le brancher à un chargeur USB ou à un ordinateur. Pour que la charge puisse s'effectuer, il est nécessaire de mettre le Gramophone en [mode "jeu" ou "programmation"](#demarrage-du-gramophone) : le Gramophone ne se chargera pas s'il est éteint !

<figure>
<img src="img/gramo-charge.svg" class="mx-auto d-block" width="80%">
</figure>

L'autonomie du Gramophone dépend de la complexité du programme exécuté, de la santé de la batterie, et du temps de charge. Il faut compter environ deux heures pour une charge complète. 

### Passer d'un programme à l'autre

Plusieurs programmes Faust peuvent être installés sur un seul Gramophone. <!-- TODO: il faut expliquer comment --> Pour passer d'un programme à un autre, il suffit de tourner la molette noire placée en bas du Gramophone :

<figure>
<img src="img/gramo-prog-change.svg" class="mx-auto d-block" width="80%">
</figure>

Les programmes sont sélectionnés en boucle. Lorsque [le Gramophone est démarré en mode "jeu"](#demarrage-du-gramophone), le premier programme est toujours sélectionné. Pour passer au deuxième programme, il suffit de tourner la molette vers la droite. Pour revenir en arrière, il faut la tourner vers la gauche. Une fois arrivé au dernier programme, tourner la molette vers la droite fait automatiquement revenir au premier programme, etc.

## Métadatas de programmation du Gramophone

## Aller plus loin : fabriquer son propre Gramophone !

Le Gramophone n'est pour l'instant pas disponible à la vente. En revanche, il est possible de fabriquer son propre Gramophone ! Pour savoir comment faire, n'hésites pas à lire le tutoriel : [Fabriquer son propre Gramophone !](making.md)
