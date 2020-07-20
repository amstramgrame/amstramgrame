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

Ce potentiomètre est adressable dans un programme Faust à l'aide de la métadata suivante : `[knob:2]`

#### La photorésistance

Le photorésistance assignable du Gramophone se trouve juste à gauche du [potentiomètre assignable](#potentiometre-assignable) et tombe sous le pouce de l'instrumentiste :

<figure>
<img src="img/gramo-photores.svg" class="mx-auto d-block" width="80%">
</figure>

Elle est adressable dans un programme Faust à l'aide de la métadata suivante : `[knob:2]`.

#### Les capteurs de mouvements

Le Gramophone abrite un accéléromètre et un gyroscope qui peuvent être utilisés pour contrôler les paramètres d'un programme Faust avec le geste. 

**>> Les informations données dans cette section se veulent être très techniques. Pour un tutoriel pas-à-pas sur l'utilisation des capteurs de mouvements du Gramophone, [clique sur ce lien](../scenari/gesture.md).**

L'accélération (accéléromètre) et l'orientation (gyroscope) du Gramophone peuvent être mesurées sur trois axes différents (X, Y et Z) :

<figure class="mx-auto d-block">
<center>
<img src="img/motion-x-l.jpg" width="48%">
<img src="img/motion-x-r.jpg" width="48%">
<figcaption>Inclinaison du Gramophone sur l'axe des X</figcaption>
</center>
</figure>

<figure class="mx-auto d-block">
<center>
<img src="img/motion-y-u.jpg" width="48%">
<img src="img/motion-y-d.jpg" width="48%">
<figcaption>Inclinaison du Gramophone sur l'axe des Y</figcaption>
</center>
</figure>

<figure>
<img src="img/motion-z.jpg" class="mx-auto d-block" width="50%">
<center><figcaption>L'axe des Z du Gramophone</figcaption></center>
</figure>

Des [métadatas Faust](TODO) peuvent être utilisées pour associer et configurer l'accéléromètre et le gyroscope du Gramophone à un paramètre d'un programme Faust :

```
[acc: a b c d e]
``` 

pour l'accéléromètre et :

```
[gyr: a b c d e]
``` 

pour le gyroscope, avec :

* `a` : l'axe de l'accéléromètre (`0` : X, `1` : Y, `2` : Z)
* `b` : la courbe de l'accéléromètre (voir la figure ci-dessous, 4 courbes sont disponibles)
* `c` : l’accélération minimale en \(m/s^2\)
* `d` : l’accélération centrale en \(m/s^2\) 
* `e` : l’accélération maximale en \(m/s^2\)

`c`, `d` et `e` sont directement associés à la configuration d'un paramètre d'un programme Faust :

```
parameter = nentry("ParamFaust[acc: a b c d e]",def,min,max,step);
``` 

* `c` est associé à `min`
* `d` est associé à `def`
* `e` est associé à `max`

<figure>
<img src="img/motion-curve.svg" class="mx-auto d-block" width="90%">
<center><figcaption>Configuration de l'accéléromètre et du gyroscope du Gramophone</figcaption></center>
</figure>

Par exemple, le gain d'un synthétiseur peut être contrôlé avec l'axe X de l'accéléromètre de la manière suivante :

```
g = nentry("gain[acc: 0 0 -10 0 10]",0.5,0,1,0.01);
```

Avec cette configuration, `g = 0` lorsque le Gramophone est incliné à 90 degrés du côté gauche, `g = 0.5` lorsque le Gramophone est maintenue droit, haut-parleur pointant vers le bas et `g = 1` lorsque le Gramophone est incliné à 90 degrés du côté droit.

<figure>
<img src="img/motion-example.jpg" class="mx-auto d-block" width="100%">
</figure>

Autre exemple : 

```
g = nentry("gain[acc: 0 0 0 0 10]",0,0,1,0.01);
```

Avec cette configuration, `g = 0` lorsque le Gramophone est incliné à 90 degrés du côté gauche et lorsque le Gramophone est maintenue droit, haut-parleur pointant vers le bas. La valeur de `g` augmente au fur et à mesure que le Gramophone est incliné vers la droite. `g = 1` lorsque le Gramophone est incliné à 90 degrés du côté droit.

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

Élément | Métadata | Description
--- | --- | ---
[Bouton](#le-bouton-assignable) | `[switch:1]` | Bouton en haut du Gramophone : délivre 1 lorsqu'il est pressé et 0 lorsqu'il ne l'est pas.
[Potentiomètre](#le-potentiometre-assignable) | `[knob:2]` | Potentiomètre entre le bouton et la photorésistance. Fourni un contrôle continu.
[Photorésistance](#la-photoresistance) | `[knob:3]` | Photorésistance en dessous du potentiomètre assignable. Fourni un contrôle continu.
[Accéléromètre](#les-capteurs-de-mouvements) | `[acc: XXX]` | Accéléromètre intégré au Gramophone. Fourni un contrôle continu. `XXX` correspond au paramètre de configuration de l'accéléromètre.
[Gyroscope](#les-capteurs-de-mouvements) | `[gyr: XXX]` | Gyroscope intégré au Gramophone. Fourni un contrôle continu. `XXX` correspond au paramètre de configuration de l'accéléromètre.

## Aller plus loin : fabriquer son propre Gramophone !

Le Gramophone n'est pour l'instant pas disponible à la vente. En revanche, il est possible de fabriquer son propre Gramophone ! Pour savoir comment faire, n'hésites pas à lire le tutoriel : [Fabriquer son propre Gramophone !](making.md)
