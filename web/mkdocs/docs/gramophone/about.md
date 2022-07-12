# Le Gramophone

<figure>
<img src="img/gramo.jpg" class="mx-auto d-block" width="80%">
</figure>

Le Gramophone est un instrument de musique programmable développé à [Grame](http://www.grame.fr) dans le cadre du projet Amstramgrame. À l'instar des instruments de musique acoustiques "traditionnels" comme la trompette, le tabla ou le violon, il permet de produire du son, d'être contrôlé par un musicien et est complètement indépendant (il n'a pas besoin d'être branché avec un câble pour fonctionner). À l'inverse des instruments acoustiques, le son qu'il produit et son comportement sont complètement malléables et peuvent être décrits par la programmation informatique grâce au [langage Faust](../faust/about.md).  

<figure>
<img src="img/gramo-overview.svg" class="mx-auto d-block" width="60%">
<center><figcaption>Fonctionnement du Gramophone</figcaption></center>
</figure>

## Vue d'ensemble

Le Gramophone est composé d'une coque en plastique, d'un haut-parleur, d'un ordinateur embarqué, d'une batterie et de capteurs ([accéléromètre, gyroscope, boussole](#les-capteurs-de-mouvements), [bouton](#le-bouton-assignable), [potentiomètre](#le-potentiometre-assignable) et [photorésistance](#la-photoresistance)). 

<figure>
<img src="img/gramo-comp0.jpg" class="mx-auto d-block" width="100%">
<center><figcaption>Composants du Gramophone (1)</figcaption></center>
</figure>

<figure>
<img src="img/gramo-comp1.jpg" class="mx-auto d-block" width="100%">
<center><figcaption>Composants du Gramophone (2)</figcaption></center>
</figure>

## Programmation du Gramophone

Le Gramophone se programme via un câble USB connecté à un ordinateur. Le [langage Faust](../faust/about.md) peut être utilisé pour programmer le Gramophone grâce aux plateformes [Faust Playground](../faust/playground.md) (programmation graphique pour les débutants) et [Faust Web IDE](../faust/ide.md) (programmation écrite/scriptée). Pour que cela fonctionne, il est nécessaire d'installer l'application [GramoLoader](loader.md) sur sa machine qui permet de faire le lien entre le navigateur web et le gramophone.

<figure>
<img src="img/gramo-prog.jpg" class="mx-auto d-block" width="90%">
<center><figcaption>Programmation du Gramophone</figcaption></center>
</figure>

Le tutoriel [Programmer le Gramophone](programming.md) donne plus de détails sur la programmation du Gramophone.

## Fonctionnement du Gramophone

### Démarrage du Gramophone

Le Gramophone abrite un interrupteur en métal qui permet de le démarrer et de l'arrêter. Cet interrupteur a trois positions pour sélectionner le mode de fonctionnement :

* en position centrale, le Gramophone est en [mode neutre](#mode-neutre) ;
* lorsqu'il est enclenché en direction du [bouton de contrôle du volume](#controle-du-volume), le Gramophone est démarré en [mode programmation](#mode-programmation) ;
* lorsqu'il est enclenché dans la direction opposée du [bouton de contrôle du volume](#controle-du-volume), le Gramophone est démarré en [mode batterie](#mode-batterie). 

<figure>
<img src="img/gramo-switch.jpg" class="mx-auto d-block" width=80%">
<center><figcaption>L'interrupteur de démarrage du Gramophone</figcaption></center>
</figure>

**Typiquement, le [mode neutre](#mode-neutre) permet de lancer le Gramophone lorsqu'il est connecté à l'ordinateur en USB et de le programmer avec l’application Gramoloader. Le [mode programmation](#mode-programmation) est un mode "debug" qui permet de forcer un programme dans le Gramophone si le mode neutre ne fonctionne pas. Le [mode batterie](#mode-batterie) permet de jouer du Gramophone sans le connecter à l'ordinateur et de charger la batterie.**

#### Mode Neutre

En mode Neutre (interrupteur en position centrale), le Gramophone peut : 

* être alimenté en électricité avec le câble USB et donc jouer ;
* être programmé sous certaines conditions (il est possible que le Gramophone n'arrive pas à installer le programme depuis l'application [GramoLoader](loader.md))

Le mode Neutre est recommandé pour l'exécution d'un programme Faust lorsque le Gramophone est branché à l'ordinateur. Si le câble USB est débranché, le Gramophone s'arrête.

**La batterie du Gramophone n'est pas sollicitée en mode Neutre : le Gramophone devrait être mis en mode Neutre lorsqu'il n'est pas utilisé pour ne pas vider la batterie.**

#### Mode Programmation

Le mode Programmation (interrupteur en direction du bouton de contrôle du volume) permet de forcer la programmation d'un Gramophone depuis le [Faust Web IDE](../faust/ide.md) ou le [Faust Playground](../faust/playground.md) via l'application [GramoLoader](loader.md). Si un programme Faust a du mal à être installé en mode Neutre, le mode Programmation devrait résoudre le problème. 

#### Mode Batterie

Le mode Batterie (interrupteur en position à l'opposé du bouton de contrôle du volume) permet de :

* faire fonctionner le Gramophone sur la batterie ;
* charger la batterie du Gramophone si celui-ci est connecté à un port USB.

<figure>
<img src="img/gramo-start.jpg" class="mx-auto d-block" width="80%">
</figure>

**Après avoir mis l’interrupteur à l’opposé du bouton de contrôle du volume, il faut attendre quelque secondes et presser/appuyer sur la molette plate. Cela permet de lancer le programme. Si cela a fonctionné, tu devrais entendre un petit son "Poc !" qui sort du Gramophone, et tu devrais pouvoir apercevoir une lumière rouge depuis l’intérieur du Gramophone, en regardant par la prise USB. Si la manipulation n'a pas fonctionné, tu peux appuyer à nouveau sur la molette. Il est important de remettre l’interrupteur en mode neutre (position centrale) après avoir terminé de jouer si on ne veut pas vider la batterie !**

### Tenir le Gramophone

Le Gramophone se tient dans la paume de la main droite avec la sangle autour de la main. Cette dernière peut être ajustée afin de tenir le Gramophone fermement. 

<figure>
<img src="img/gramo-holding1.jpg" class="mx-auto d-block" width="80%">
</figure>

Il est important de noter que la sangle n'est pas placée sur le Gramophone de manière symétrique : [la photorésistance](#la-photoresitance) (capteur de lumière) doit tomber sous le pouce et [le bouton assignable](#le-bouton-assignable) sous le majeur :

<figure>
<img src="img/gramo-holding0.jpg" class="mx-auto d-block" width="80%">
</figure>

### Contrôle du volume

Le volume du son produit par le Gramophone peut être contrôlé par le potentiomètre se trouvant juste au-dessus de la prise jack (celui qui se trouve en bas de la main lorsque l'on tient le Gramophone) :

<figure>
<img src="img/gramo-volume.jpg" class="mx-auto d-block" width="80%">
<center><figcaption>Potentiomètre de contrôle du volume du Gramophone</figcaption></center>
</figure>

> Il est important de noter que le volume du son produit dépend aussi fortement du programme exécuté sur le Gramophone.

### Contrôle des paramètres du son

Le son produit par le Gramophone peut être contrôlé à l'aide de différents éléments d'interface. Chacun d'entre eux peut être assigné directement dans un programme Faust à un paramètre du son à l'aide de [métadatas](#metadatas-de-programmation-du-gramophone) (le fonctionnement des métadatas dans Faust est détaillé [ici](#metadatas-de-programmation-du-gramophone)).

#### Le bouton assignable

Le bouton assignable du Gramophone se trouve à l'opposé du [potentiomètre de volume](#controle-du-volume) et tombe sous le majeur du musicien :

<figure>
<img src="img/gramo-button.jpg" class="mx-auto d-block" width="80%">
</figure>

Il est adressable dans un programme Faust à l'aide de la métadata suivante : `[switch:1]`

#### Le potentiomètre assignable

La potentiomètre assignable du Gramophone se trouve juste à gauche du [bouton assignable](#bouton-assignable) :

<figure>
<img src="img/gramo-pot.jpg" class="mx-auto d-block" width="80%">
</figure>

Il est "typiquement" actionné par la main gauche de l'instrumentiste.

Ce potentiomètre est adressable dans un programme Faust à l'aide de la métadata suivante : `[knob:2]`

#### La photorésistance

Le photorésistance assignable du Gramophone permet de capter la lumière. Elle se trouve juste à gauche du [potentiomètre assignable](#potentiometre-assignable) et tombe sous le pouce de l'instrumentiste :

<figure>
<img src="img/gramo-photores.jpg" class="mx-auto d-block" width="80%">
</figure>

Elle est adressable dans un programme Faust à l'aide de la métadata suivante : `[knob:3]`.

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

Des [métadatas Faust](#metadatas-de-programmation-du-gramophone) peuvent être utilisées pour associer et configurer l'accéléromètre et le gyroscope du Gramophone à un paramètre d'un programme Faust :

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
<img src="img/motion-curve.jpg" class="mx-auto d-block" width="90%">
<center><figcaption>Configuration de l'accéléromètre et du gyroscope du Gramophone</figcaption></center>
</figure>

Par exemple, le gain d'un synthétiseur peut être contrôlé avec l'axe X de l'accéléromètre de la manière suivante :

```
g = nentry("gain[acc: 0 0 -10 0 10]",0.5,0,1,0.01);
```

Avec cette configuration, `g = 0` lorsque le Gramophone est incliné à 90 degrés du côté gauche, `g = 0.5` lorsque le Gramophone est maintenu droit, haut-parleur pointant vers le bas et `g = 1` lorsque le Gramophone est incliné à 90 degrés du côté droit.

<figure>
<img src="img/motion-example.jpg" class="mx-auto d-block" width="100%">
</figure>

Autre exemple : 

```
g = nentry("gain[acc: 0 0 0 0 10]",0,0,1,0.01);
```

Avec cette configuration, `g = 0` lorsque le Gramophone est incliné à 90 degrés du côté gauche et lorsque le Gramophone est maintenu droit, haut-parleur pointant vers le bas. La valeur de `g` augmente au fur et à mesure que le Gramophone est incliné vers la droite. `g = 1` lorsque le Gramophone est incliné à 90 degrés du côté droit.

### Charger le Gramophone

Pour charger la batterie du Gramophone, il suffit de le brancher à un chargeur USB ou à un ordinateur. Pour que la charge puisse s'effectuer, il est nécessaire de mettre le Gramophone en [mode batterie](#mode-batterie) : le Gramophone ne se chargera pas s'il est en mode neutre ou en mode Programmation !

<figure>
<img src="img/gramo-charge.jpg" class="mx-auto d-block" width="80%">
</figure>

L'autonomie du Gramophone dépend de la complexité du programme exécuté, de la santé de la batterie, et du temps de charge. Il faut compter environ deux heures pour une charge complète. 

<!--
### Passer d'un programme à l'autre

Plusieurs programmes Faust peuvent être installés sur un seul Gramophone. Pour passer d'un programme à un autre, il suffit de tourner la molette noire placée en bas du Gramophone :

<figure>
<img src="img/gramo-prog-change.jpg" class="mx-auto d-block" width="80%">
</figure>

Les programmes sont sélectionnés en boucle. Lorsque le Gramophone est démarré en [mode Neutre](#mode-neutre) ou en [mode Batterie](#mode-batterie), le premier programme est toujours sélectionné. Pour passer au deuxième programme, il suffit de tourner la molette vers la droite. Pour revenir en arrière, il faut la tourner vers la gauche. Une fois arrivé au dernier programme, tourner la molette vers la droite fait automatiquement revenir au premier programme, etc.
-->

## Métadatas de programmation du Gramophone

Élément | Métadata | Description
--- | --- | ---
[Bouton](#le-bouton-assignable) | `[switch:1]` | Bouton en haut du Gramophone : délivre 1 lorsqu'il est pressé et 0 lorsqu'il ne l'est pas.
[Potentiomètre](#le-potentiometre-assignable) | `[knob:2]` | Potentiomètre entre le bouton et la photorésistance. Fourni un contrôle continu.
[Photorésistance](#la-photoresistance) | `[knob:3]` | Photorésistance en dessous du potentiomètre assignable. Fourni un contrôle continu.
[Accéléromètre](#les-capteurs-de-mouvements) | `[acc: XXX]` | Accéléromètre intégré au Gramophone. Fourni un contrôle continu. `XXX` correspond au paramètre de configuration de l'accéléromètre.
[Gyroscope](#les-capteurs-de-mouvements) | `[gyr: XXX]` | Gyroscope intégré au Gramophone. Fourni un contrôle continu. `XXX` correspond au paramètre de configuration de l'accéléromètre.

<!-- Comme la section correspondante n'existe pas encore, on la commente cette section
## Aller plus loin : fabriquer son propre Gramophone !

Le Gramophone n'est pour l'instant pas disponible à la vente. En revanche, il est possible de fabriquer son propre Gramophone ! Pour savoir comment faire, n'hésites pas à lire le tutoriel : [Fabriquer son propre Gramophone !](making.md)
-->
