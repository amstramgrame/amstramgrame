# Le Faust Playground

Le [Faust Playground](https://faustplayground.grame.fr/) est un outil en ligne (accessible sur <https://faustplayground.grame.fr/>) permettant d'assembler des programmes écrits en Faust de manière simple avec une interface graphique. Il peut également exporter les programmes produits vers les différentes plateformes supportées par Faust pour créer des applications pour smartphones, programmer le Gramophone, créer des plug-ins audios, etc.

<figure>
<img src="img/playground-kis-echo.jpg" class="mx-auto d-block" width="100%">
<center><figcaption>Le Faust Playground</figcaption></center>
</figure>

Bien que le Faust Playground soit compatible avec la plupart des navigateurs web, il est fortement recommandé d'utiliser Google Chrome ou Mozilla Firefox.

## Produire du son

Le Faust Playground se présente sous la forme d'un "établi" vide sur lequel des objets écrits en Faust peuvent être placés et connectés entre-eux. Le bouton "LIBRARY" en haut à gauche de l'écran permet d'avoir accès à une collection d'objets Faust prêt à l'emploi :

<figure>
<img src="img/playground-empty.jpg" class="mx-auto d-block" width="100%">
</figure>

Dans le menu qui s'ouvre, sélectionnez le premier élément (Kisana) dans la liste "Instruments" en cliquant dessus :

<figure>
<img src="img/playground-lib.jpg" class="mx-auto d-block" width="100%">
</figure>

L'objet Kisana qui est un synthétiseur de harpe devrait alors être placé sur l'établi. Afin de pouvoir entendre le son qu'il produit, il est nécessaire de le connecter au haut-parleur à droite de l'écran en tirant un câble entre le point rouge de Kisana et le point vert sur le haut-parleur (pour cela, il suffit de maintenir le clique sur le point rouge et de "tirer" le câble vers le point vert) : 

<figure>
<img src="img/playground-kis-sel.jpg" class="mx-auto d-block" width="100%">
</figure>

Les trois premiers potentiomètres (points verts) de Kisana permettent d'actionner les cordes de la harpe : bougez les et vous devriez entendre du son !

<figure>
<img src="img/playground-kis.jpg" class="mx-auto d-block" width="100%">
</figure>

## Instruments vs. effets

Le menu LIBRARY donne accès à deux types d'éléments : des "instruments" qui produisent du son et des "effets" qui traitent du son. À la différence des instruments, les effets ont une entrée audio matérialisée par un point vert à leur gauche. 

Dans le menu LIBRARY sélectionne l'effet "Echo" et connecte le à Kisana puis au haut-parleur : 

<figure>
<img src="img/playground-kis-echo.jpg" class="mx-auto d-block" width="100%">
</figure>

Change ensuite la valeur du paramètre "echo intensity" et tu devrais entendre un écho appliqué au son de Kisana. 

En pratique n'importe quel instrument peut être connecté à n'importe quel effet. De la même manière, plusieurs effets peuvent être connectés entre-eux :

<figure>
<img src="img/playground-multi.jpg" class="mx-auto d-block" width="100%">
</figure>

N'hésitez pas à être créatif et à essayer différentes combinaisons d'objets ! 

## Exporter un programme vers le Gramophone

Tout programme écrit et fonctionnant dans le Faust Playground peut être envoyé vers le Gramophone connecté à l'ordinateur. [**La page "programmer le Gramophone"**](../gramophone/programming.md) donne la marche à suivre.
