# Hello World : mon premier programme Faust

Le but de ce scénario est d'écrire un programme [Faust](../faust/about.md) très simple et de le faire fonctionner sur ton [Gramophone](../gramophone/about.md) ! Tu apprendras donc à :

* produire du son avec Faust ;
* maîtriser la structure de base d'un programme Faust ;
* exporter un programme Faust vers le Gramophone depuis de la [Faust Web IDE](../faust/ide.md) ;
* assigner des boutons et des potentiomètres du Gramophone à différents paramètres du programme Faust.

**Avant de commencer, assures toi que le volume de ton ordinateur n'est pas trop fort, surtout si tu travailles avec un casque !** Comme nous allons créer nos propres sons et faire quelques expériences, il est possible que le volume du son augmente brusquement : fais attention à tes oreilles.

## Pourquoi "Hello World" ?

En programmation informatique, le premier programme que l'on apprend à écrire dans la plupart des langages consiste à afficher "Hello World", d'où son nom. Comme Faust est spécialement conçu pour "programmer des sons", il n'est pas vraiment capable d'afficher du texte sur l'écran comme d'autres langages ou en tout cas, lui demander de faire ça n'aurait pas de sens. En revanche, synthétiser un son pur avec une sinusoïde peut être vu comme une des manières les plus simple de produire du son avec Faust. C'est pourquoi notre "Hello World" en Faust consistera à produire un son pur et à le contrôler. 

## Produire du son avec Faust

### Une sinusoïde en Faust

Faust permet d’interagir directement avec le haut-parleur de notre ordinateur ou du Gramophone en décrivant le son produit avec du code. Dans le cas de Faust, le code peut être vu comme une succession de formules mathématiques connectées entres-elles. 

Pour qu'un haut-parleur produise un son, il est nécessaire de le faire vibrer c'est à dire que la position de sa membrane doit évoluer dans le temps. Cette opération peut être effectuée en envoyant une onde sinusoïde au haut-parleur : 

<figure>
<img src="img/sine-speaker.jpg" class="mx-auto d-block" width="100%">
</figure>

Le programme Faust suivant produit une onde sinusoïdale :

<!-- faust-run -->
```
import("stdfaust.lib");
process = os.osc(440);
``` 
<!-- /faust-run -->

Clique sur le bouton "Éditer/exécuter le programme" ci-dessus et ce programme Faust devrait être ouvert dans le [Faust Web IDE](../faust/ide.md). Cet outil permet d'écrire du code Faust directement dans un navigateur web, d'entendre le son qu'il produit, puis de l'envoyer vers un Gramophone. 

**Le Faust Web IDE fonctionne mieux dans Mozilla Firefox ou dans Google Chrome que dans les autres navigateurs. Plus d'informations sur cet outil sont disponibles [ici](../faust/ide.md).**

Pour entendre le son produit par ce programme Faust, il est nécessaire de l'exécuter. Pour cela, il suffit de cliquer sur le bouton "Run" dans le Faust Web IDE :

<figure>
<img src="img/ide-sine.jpg" class="mx-auto d-block" width="100%">
</figure>

Le son que tu entends est celui d'une sinusoïde, en terme acoustique on appelle ça un "son pur" (il est très proche du son produit par un diapason).

Pour arrêter le son, il est nécessaire de stopper l'exécution du programme ce qui se fait en cliquant sur la croix permettant de fermer l'instance du programme :

<figure>
<img src="img/ide-sine-close.jpg" class="mx-auto d-block" width="100%">
</figure>

Analysons rapidement les différents élément constituants ce programme. La dernière (la deuxième) ligne est la plus importante : c'est elle qui permet de produire le son. `process` correspond au programme et dans une certaine mesure au haut-parleur. On dit donc ici que le haut-parleur est égal à `os.osc(440)`. `os.osc` implémente un oscillateur sinusoïdal, c'est que l'on appelle une **fonction**. La fonction `os.osc` a un seul paramètre : sa fréquence qui est ici configurée à 440 Hz (ce qui correspond à un La en musique). La fréquence de la sinusoïde permet donc de contrôler la hauteur du son.  

La première ligne (`import("stdfaust.lib");`) importe les bibliothèques standard de Faust et permet donc d'avoir accès à la fonction `os.osc`. Note que toutes les déclarations en Faust se termine par un point-virgule : cela est très important et c'est une source d'erreur assez commune.  

### Exercice : changer la hauteur du son

Comme il l'a été dit juste avant, la hauteur du son produit par la sinusoïde est déterminée par sa fréquence (ici 440 Hz). L'être humain peut normalement entendre toutes les fréquences entre 20 et 20000 Hz. Toutefois, plus on vieilli, moins on entend les fréquences élevées. Ainsi, tes "vieux profs" n'entendent certainement plus aucune fréquence au dessus de 16000 Hz. Les sons au dessus de 3000 Hz peuvent être très désagréables à entendre. Essaye de changer la valeur de la fréquence de `os.osc` pour observer l'effet sur le son produit en veillant à ne pas dépasser 3000. Si tu n'entends pas de son, assure-toi que le programme Faust est bien exécuté. 

## Ajouter des paramètres à un programme Faust

Faust permet de contrôler les différents paramètres d'un programme avec des éléments d'interface utilisateur (ex. boutons, potentiomètres, etc.). Le but de cette section est :

* d'ajouter un bouton au programme Faust pour activer et déactive la production du son ;
* d'ajouter un potentiomètre pour contrôler la hauteur du son.

### Ajouter un bouton pour activer le son

Commençons par le bouton, un bouton peut être créé en Faust avec `button("nom")` où `nom` est le nom du bouton. Cet élément est égal à 1 lorsqu'il est pressé et à 0 lorsqu'il ne l'est pas. Il suffit donc de le multiplier à `os.osc` (multiplier par 0 revient à supprimer le son de `os.osc` et multiplier par 1 à le laisser inchangé) :

<!-- faust-run -->
```
import("stdfaust.lib");
process = os.osc(440)*button("on-off");
``` 
<!-- /faust-run -->

Essaye ce programme dans le Faust Web IDE ! Un bouton devrait apparaître en bas de l'écran quand le code est exécuté. Appuie dessus pour observer son comportement.

Afin de rendre ce programme plus propre, il est possible d'assigner notre bouton à une variable :

<!-- faust-run -->
```
import("stdfaust.lib");
on = button("on-off");
process = os.osc(440)*on;
``` 
<!-- /faust-run -->

Ici, `on` sera égal à 1 quand le bouton est pressé et à 0 quand il ne l'est pas. 

### Ajouter un potentiomètre pour contrôler la hauteur du son

Effectuons une opération similaire pour le paramètre fréquence de `os.osc` en lui assignant un potentiomètre. Cela est fait en Faust en utilisant l'objet `hslider("nom",a,b,c,d)` où `nom` est le nom du paramètre, `a` sa valeur initiale, `b` son minimum, `c` son maximum et `d` sa précision. Dans le cas du paramètre fréquence, `a` peut être égal à 440 puisqu'il s'agit de la valuer par défaut, `b` à 20 puisque c'est la fréquence la plus basse qui puisse être entendue par l'Homme, `c` à 3000 (pour ne pas trop nous casser les oreilles) et `d` à 1 pour que les valeurs changent de 1 en 1 (ce paramètre n'a pas vraiment d'importance dans le cas présent) :

<!-- faust-run -->
```
import("stdfaust.lib");
on = button("on-off");
process = os.osc(hslider("frequence",440,20,3000,1))*on;
``` 
<!-- /faust-run -->

De la même manière que pour le bouton, le potentiomètre peut être placé dans une variable :

<!-- faust-run -->
```
import("stdfaust.lib");
on = button("on-off");
freq = hslider("frequence",440,20,3000,1);
process = os.osc(freq)*on;
``` 
<!-- /faust-run -->

## Quelques points importants à savoir

Apprendre à maîtriser un langage de programmation peut prendre des mois voir des années, il est donc assez difficile de tout savoir sur Faust à ce stade :). En revanche, voici quelques conseils pour éviter les erreurs :

* ne pas oublier les points virgules ;
* ne pas utiliser de caractères spéciaux dont les accents en Français (ex. ç, ê, é, œ, etc.) ;
* diminuer le volume du son quand on ne sait pas trop ce qu'on fait (un accident est vite arrivé).