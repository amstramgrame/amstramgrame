# Capter le geste : travailler avec l'accéléromètre

Le Gramophone abrite deux capteurs permettant de mesurer sa position et son déplacement dans l'espace : un accéléromètre et un gyroscope. Ce type de capteur est très commun de nos jours. On les retrouve par example dans la plupart des smartphones et des ordinateurs. Dans le cas du Gramophone, ils peuvent être utilisés pour contrôler les paramètres du son produit par l'instrument. Le but de ce scénario est d'apprendre à utiliser l'accéléromètre du Gramophone pour créer des instruments de musique expressifs. L'utilisation du gyroscope sera étudiée dans un autre scénario.   

Un accéléromètre mesure l'accélération, c'est-à-dire le fait de changer la vitesse d'un objet dans l'espace. Si l'objet ne bouge pas ou qu'il se déplace à une vitesse constante, aucune accélération n'est mesurée. C'est un peu comme être assis dans une voiture quand elle accélère ou qu'elle freine : dans ces deux cas, notre corps perçois une "accélération". L'accéléromètre du Gramophone est tellement sensible qu'il peut aussi être influencé par la gravité de la terre. Dans ce cas là, il peut être utilisé pour mesurer l'inclinaison du Gramophone dans l'espace. 

## Choisir un axe

L'accéléromètre du Gramophone est capable de mesurer l'accélération dans plusieurs directions : X, Y et Z. Les différents axes de l'accéléromètre du Gramophone sont présentés [ici](../gramophone/about.md#les-capteurs-de-mouvements). 

Pour contrôler un paramètre d'un programme Faust avec un des axes de l'accéléromètre, il suffit d'utiliser la métadata `[acc: a b c d e]` dans la déclaration du nom du paramètre. `a` permet de choisir l'axe de accéléromètre (0 pour X, 1 pour Y et 2 pour Z). Par exemple, dans le programme pour Gramophone suivant :

<!-- faust-run -->
<div class="faust-run">
~~~

import("stdfaust.lib");

freq = hslider("freq[acc: 0 0 -10 0 10]",1050,100,2000,0.01) : si.smoo;
gate = checkbox("gate[switch:1]") : si.smoo;

process = os.osc(freq)*gate;

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/scenari/gesture/exfaust0/exfaust0.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

le paramètre `freq` (fréquence) est contrôlé par l'axe X de l'accéléromètre (`acc: 0`). Lance ce programme sur le Gramophone et observe ce qui se passe. Pour qu'un son soit produit, il faut appuyer une fois sur le [bouton assignable](../gramophone/about.md#le-bouton-assignable) du Gramophone. 

En inclinant le Gramophone de la manière suivante :

<figure>
<img src="img/motion-x-freq.jpg" class="mx-auto d-block" width="100%">
</figure>

tu devrais pouvoir contrôler précisément la hauteur du son produit.

## Exercise : changer d'axe

Avant d'expliquer à quoi correspondent les autres paramètres de la métadata `[acc: a b c d e]`, essaye de modifier le code précédent pour utiliser l'axe des Y plutôt que l'axe des X pour contrôler la hauteur du son produit : `[acc: 1 0 -10 0 10]`. Tente de repérer l'orientation de l'axe des Y sur le Gramophone. N'hésites pas à lire [cette page](../gramophone/about.md#les-capteurs-de-mouvements) si tu as besoin d'aide.

## Utiliser des courbes de contrôle

Quatre courbes peuvent être utilisées pour configurer la manière dont l'accéléromètre contrôle un paramètre d'un programme Faust :

<figure>
<img src="img/motion-curve.jpg" class="mx-auto d-block" width="90%">
</figure>

Elles sont directement liées au paramètre `b` de l'accéléromètre. Dans l'exemple précédent, `b=0`, la valeur du paramètre évolue donc de manière croissante et linéaire le long de l'axe des X. Essaye de configurer `b=1` afin d'inverser l'orientation de l'accéléromètre :

<!-- faust-run -->
<div class="faust-run">
~~~

import("stdfaust.lib");

freq = hslider("freq[acc: 0 1 -10 0 10]",1050,100,2000,0.01) : si.smoo;
gate = checkbox("gate[switch:1]") : si.smoo;

process = os.osc(freq)*gate;

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/scenari/gesture/exfaust1/exfaust1.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

Les courbes 2 et 3 présentent des comportements plus complexes. N'hésites pas à les essayer aussi !

## Configuration avancée

Les paramètres `c`, `d` et `e` permettent de configurer l'accélération de référence du Gramophone pour différents points dans l'espace. Comme il s'agit de paramètres plus avancés, nous n'allons pas les détailler ici. 

Les paramètres d'un `hslider` jouent aussi un rôle important dans le comportement des accéléromètres. Dans les exemples précédents, la valeur initiale (1050) du slider était toujours placée précisément entre la valeur minimale (100) et la valeur maximale (2000) : `hslider("freq[acc: 0 1 -10 0 10]",1050,100,2000,0.01)`. La valeur initiale de `hslider` correspond toujours à la position centrale du Gramophone. Ainsi, si on la déplace plus ou moins près de la valeur maximale ou de la valeur minimale, on changera la comportement de l'accéléromètre. Par exemple, essaye de configurer la valeur initiale à 200 :

<!-- faust-run -->
<div class="faust-run">
~~~

import("stdfaust.lib");

freq = hslider("freq[acc: 0 1 -10 0 10]",200,100,2000,0.01) : si.smoo;
gate = checkbox("gate[switch:1]") : si.smoo;

process = os.osc(freq)*gate;

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/scenari/gesture/exfaust2/exfaust2.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->

La hauteur du son évolue lentement de 100 à 200 Hz lorsque le Gramophone est placé à gauche, puis plus rapidement de 200 à 2000 Hz lorsqu'il est placé à droite.

## Contrôler plusieurs paramètres

Plusieurs métadatas d'accéléromètre peuvent être déclarées en parallèle pour contrôler différents paramètres. Par exemple, il est possible d'ajouter un paramètre de contrôle du gain à notre synthétiseur précédent et de le contrôler avec l'axe des Y de l'accéléromètre :

<!-- faust-run -->
<div class="faust-run">
~~~

import("stdfaust.lib");

freq = hslider("freq[acc: 0 0 -10 0 10]",200,100,2000,0.01) : si.smoo;
gain = hslider("gain[acc: 1 0 -10 0 10]",0.5,0,1,0.01) : si.smoo;
gate = checkbox("gate[switch:1]") : si.smoo;

process = os.osc(freq)*gain*gate;

~~~

<a href="https://faustide.grame.fr/?mode=amstram&code=https://www.amstramgrame.fr/scenari/gesture/exfaust3/exfaust3.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
</div>
<!-- /faust-run -->
