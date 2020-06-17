# Niveau 1

## Prise en main du Gramophone/Smartphone

**Durée** : 2h  
**Niveau** : Débutant  
**Notions** : Prise en main du Gramophone, contrôleur discrets vs. continus, captation de gestes, introduction à la musique électronique expérimentale  
**Disciplines liées** : Toutes - Introduction généraliste  
**Prérequis** : Aucun

* Le but principal de cette leçon est de prendre en main le gramophone/smartphone par l’exécution d’une courte pièce musicale utilisant un programme pré-installé sur le Gramophone (pas de programmation requise). Cette leçon doit être avant tout ludique pour motiver les élèves à faire les autres scénarii d’AmstramGrame par la suite.
* La leçon commence par l’apprentissage d’une pièce utilisant les différents capteurs du Gramophone (capteur de lumière, capteur de pression, bouton, potentiomètre, accéléromètre, gyroscope, etc.).
* Une fois cette pièce apprise et maîtrisée, les élèves étudient lors d’une seconde étape le fonctionnement de chaque capteur. Par exemple, les différences entre l’accéléromètre et le gyroscope sont étudiées (ex. position relative vs. position absolue), les élèves observent les effets de la captation de position par rapport à la détection d’accélérations, etc. 
* On explique que les gramophones peuvent être programmés et que les différents capteurs peuvent être assignés à n’importe quel paramètre d’un générateur de son. Par exemple, un des capteurs de pression pourrait contrôler la hauteur du son généré dans le cas de la pièce étudiée lors de la première étape de cette leçon mais pourrait être utilisé pour contrôler le volume d’un son dans le cas d’un autre programme.
* Cette leçon se termine en faisant une ouverture/présentation de la suite des activités d’AmstramGrame : musique électronique, programmation, physique, mathématique, etc.

<!-- TODO: on pourrait avoir une photo du gramophone avec un peu plus de détail -->

## Les différents types de sons et leurs paramètres

**Durée** : 2h  
**Niveau** : Débutant  
**Notions** : Différents types de sons, échelle linéaire vs. échelle logarithmique, fréquence/hauteur, gain/vélocité  
**Disciplines liées** : Approche scientifique // physique, mathématique  
**Prérequis** : Prise en main du gramophone/smartphone  

* L’objectif de cette leçon est de présenter les différentes types de sons (ex. bruits, sons pures, harmoniques/inharmoniques) et leurs paramètres associés (ex. gain et fréquence).
* Un programme pré-installé <!-- TODO: voir comment gérer ça -->
sur le gramophone permet d’entendre ces différents types de sons et de contrôler leurs paramètres avec les différents capteurs.
* Le code source de ce programme devrait pouvoir être visualisé par les élèves qui le souhaiteraient. <!-- TODO: justement, ça pourrait être ici --> 
* Le concept de gain est introduit. On explique que le gain n’est pas une valeur linéaire et qu’il faut plus que deux gramophones pour doubler le volume du son perçu, etc. Dans ce contexte là, un mode du programme pré-installé sur le gramophone pourrait fonctionner en linéaire et un autre en logarithmique pour entendre la différence d’un point de vue perceptuel. <!-- TODO: je doute qu'un prof de physique même expérimenté sache de quoi on parle là, il faudrait être plus précis. -->
* Le concept de fréquence est introduit. On étudie son lien avec la "hauteur" d’un son et pourquoi pas avec les notes de musique. De la même manière que pour le gain, on explique que ce paramètre n’est pas linéaire et qu’il faut doubler la fréquence d’un son pour passer à l’octave supérieure. 
* Le bruit n’a qu’un seul paramètre : son gain.
* Un son pur est produit par une onde sinusoïdale. Il a deux paramètres : la fréquence (hauteur) et le gain.
* Un son complex est composé de plusieurs sons pures (lien avec la leçon sur la synthèse additive). 
* Dans le cas d’un son harmonique, la fréquence de chaque son pur est un multiple du son pur ayant la fréquence la plus basse (fondamentale).
* Dans le cas d’un son inharmonique, la fréquence de chaque son pure ne dépend pas de la fondamentale.

## Anatomie d’un programme Faust

**Durée** : 1h  
**Niveau** : Débutant  
**Notions** : Bibliothèque (programmation), variable, contrôle du gain par une multiplication, interface graphique  
**Disciplines liées** : Approche scientifique // programmation  
**Prérequis** : Aucun  

* L’objectif de cette leçon est d’étudier et de comprendre la structure de base d’un programme Faust. 
* Cette leçon utilise l’éditeur en ligne de Faust (intégrer dans le site web d’Amstramgrame) mais pas le gramophone
* Le programme étudié pourrait prendre la forme suivante : 

<!-- faust-run -->
<div class="faust-run"><img src="exfaust0/exfaust0.svg" class="mx-auto d-block">
~~~

import("stdfaust.lib");
freq = hslider("freq",440,50,3000,0.01);
gain = hslider("gain",1,0,1,0.01);
gate = button("gate");
process = os.sawtooth(freq)*gain*gate;

~~~

<a href="https://faustide.grame.fr/?code=https://grame-cncm.github.io/amstramgrame//scenari/niveau1/exfaust0/exfaust0.dsp" target="editor">
<button type="button" class="btn btn-primary">Éditer/exécuter le programme >></button></a>
<button type="button" class="btn btn-primary">Charger sur le Gramophone >></button></a>
</div>
<!-- /faust-run -->

* L’ensemble des éléments de ce programme sont étudiés (ex. concepts de bibliothèque, de variable, d’élément d’interface utilisateur, etc.).
* On explique que le gain d’un signal peut être contrôlé en le multipliant par un nombre entre 0 et 1 (ce qui revient à le diviser).  
* Concept d'interrupteur : le son peut être joué ou non en appuyant sur un bouton. En étant en mesure de contrôler la hauteur d’un son, son gain et le fait qu’il soit actif ou non permet de mettre en place un synthétiseur complet. 
* Cette leçon peut prendre la forme d’un tutoriel pas à pas.
* Une ouverture est faite à la fin de la leçon pour expliquer que ce programme qui fonctionne dans le cas présent dans le navigateur web peut être exporté vers le gramophone et que les curseurs et boutons présents dans l’interface graphique pourraient-être remplacés/assignés à des capteurs du gramophone.

## Programmer le Gramophone
**Durée** : 2h</br>
**Niveau** : Débutant</br>
**Notions** : Programmation du Gramophone</br>
**Disciplines liées** : approche scientifique // programmation</br>
**Prérequis** : Anatomie d’un programme Faust</br>

* L’objectif de cette leçon est d’apprendre à programmer le gramophone et d’associer certains de ses capteurs (capteurs “simples” comme le capteur de pression et de lumière, pas les accéléromètres) à des paramètres du programme Faust.
* Le programme étudié pourrait prendre la forme suivante (version adaptée du programme présenté dans la leçon “Anatomie d’un programme Faust”) : 

```
import("stdfaust.lib");
freq = hslider("freq[gp:p0]",440,50,3000,0.01);
gain = hslider("gain[gp:p1]",1,0,1,0.01);
process = os.sawtooth(freq)*gain;
```

* L’application d’interface entre la machine utilisée pour la programmation en Faust et le gramophone est étudiée.
* Les metadatas de capteurs (ex. `[gp:p0]`) sont présentées et leur fonctionnement est décrit.
* Des exercices autour du changement des mappings des paramètres (par exemple augmenter ou diminuer la gamme de la fréquence) sont effectués.
* Différents oscillateurs sont utilisés pour produire différents types de sons (ex. dent de scie, triangle, sinus, etc.) : lien avec la leçon “Introduction au design sonore”.  

<h2 id= "pieces-gramophone">L'orchestre de bruit</h2>
**Durée** : 12 séances</br>
**Niveau** : Débutant</br>
**Notions** : Orchestre de Gramophone, musique d’ensemble, geste</br>
**Disciplines liées** : Technologie - Art Plastique - Musique</br>
**Prérequis** : Le lieu doit être un laboratoire, une salle informatique oubien une salle d'orchestre</br>
</br>
**Résumé :**</br>
En 1913, Luigi Russolo rédige l’Art des bruits qui théorise l’utilisation des bruits pour un usage musical. Il réalise notamment des partitions pour orchestre de bruit qui seront interprétées par son intonarumori, un ensemble de machines mécaniques aux sons étranges.
Dans cette séquence, nous proposons aux élèves de construire leur propre orchestre de bruit en passant par la découverte du mouvement futuriste, la programmation de l’instrument à l’aide du Gramophone sur le site AmStramGrame et l’élaboration d’une partition graphique en groupe.
</br>
</br>
**Découverte du courant futuriste et de Luigi Russolo.**
</br>
« L’arts des bruits » manifeste apparu en 1913 par Luigi Russolo. Dans ce manifeste Russolo y s soutient l’idée que l’oreille humaine s’est habitué au bruit. Un bruit devient musique dès lors qu’il est organisé.
Ressources : Vidéo Intonarumori / Image partitions / photo historique / Peinture / Poème futuristes / Extensions > Musiques concrètes, Musiques industrielles, Alva Noto, Aphex Twin, Merzbow...
</br>
</br>
**Initiation au Gramophone**
</br>
Découverte de l’instruments (différents capteurs, lien avec le geste) à l’aide de scripts pré-écrits. Découverte de la programmation (Découverte de l’interface Web via le site AmStramGrame), découverte des ressources Faust (librairies proposées, docs...)
</br>
</br>
**Construction de l’instrument (4 séances) :**
</br>
Création d’une machine à bruit par séance (ex : percussion, périodique, bruit blanc, boucle)
A partir des différents blocs de scripts Faust disponibles sur le site AmStramGram, les élèves assembleront les différentes parties de scripts (copier/coller) et les organiseront selon leur choix.
Chaque élève présente le script de son Gramophone au groupe Jeu collectif en groupe des machines
</br>
</br>
**Codage partition (4 séances) :**
</br>
Création d’une partition du Gramophone en s’inspirant des partitions des codes d’Hugo Piatti, etc... Création d’un vocabulaire commun (musical, gestuel associé au gramophone,etc...) Construction du support (papiers, formats, couleurs, etc...)
</br>
</br>
**Répétition Orchestre x2 :**
</br>
Les dernières séances seront consacrées à l’élaboration de pupitres (rassemblement des instruments par famille de bruits).
Répétition de l’oeuvre (différents mouvement, travail avec un chef d’orchestre, nuances, postures,etc...)
</br>
</br>
**Restitution publique**
