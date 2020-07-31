# Protocole d'assemblage et de test du Gramophone

Ce document contient les éléments permettant d'assembler et de tester un Gramophone. Il sert de plateforme d'échange entre le département de la recherche de GRAME et la personne en charge de l'assemble des Gramophones. [La première section](#assemblage-du-gramophone) de ce document concerne l'assemblage du Gramophone. [La seconde](#procédure-de-test-du-gramophone) présente la procédure de test du Gramophone après assemblage.

## Assemblage du Gramophone

Le Gramophone est constitué de composants électroniques, d'une carte [TTGO T-Audio](https://github.com/LilyGO/TTGO-TAudio) et d'une coque en plastique.

### Coque du Gramophone

Le code source de la coque du Gramophone peut être trouvé à l'adresse suivante : <https://github.com/grame-cncm/gramophone>). La coque du Gramophone est composée de trois éléments :

<figure>
<img src="img/0.jpg" class="mx-auto d-block" width="80%">
</figure>

En haut à gauche sur la figure ci-dessus, on trouve le cache de protection du haut-parleur, à droite l'élément principal et en bas à gauche l'arrière du Gramophone qui permet d'accéder au circuit après assemblage.

### Composants et outils nécessaire

En plus de sa coque, le Gramophone est composé des éléments suivants :

* 8 vis YLX TF 2x10 PZ1 AB SPAX
* 4 vis YLX TF 2.5x10 PZ1 AB SPAX
* 6 rondelles plates étroites ø3
* 2 [boutons poussoirs encastrables](https://www.amazon.fr/gp/product/B07QL1BC23/ref=ppx_yo_dt_b_asin_title_o09_s01?ie=UTF8&psc=1)
* 1 [batterie rechargeable 3.7V Lithium-ion, 2.05 Ah](https://fr.farnell.com/bak/103456a-1s-3m/batterie-lithium-ion-3-7v-2050/dp/2401856?CMP=i-ddd7-00001003)
* Scotch électrique
* 2 connecteurs Dupont mâles
* 2 connecteurs Dupont femelles
* 2 boîtiers à 2 emplacements pour connecteur Dupont
* 1 carte [TTGO T-Audio](https://fr.aliexpress.com/item/32846510254.html?spm=a2g0s.9042311.0.0.941c6c37Yz8qsL)
* 1 câble de connection de batterie à souder (livré avec la carte TTGO T-Audio)
* 1 [haut-parleur AIYIMA 4Ohms 3W](https://fr.aliexpress.com/item/32593991938.html?spm=a2g0s.9042311.0.0.941c6c37Yz8qsL)
* 1 [encodeur encastrable avec bouton poussoir intégré](https://www.amazon.fr/gp/product/B07DM2GN2Z/ref=ppx_yo_dt_b_asin_title_o04_s01?ie=UTF8&psc=1)
* 1 [photorésistance](https://www.amazon.fr/gp/product/B074QLFCF6/ref=ppx_yo_dt_b_asin_title_o02_s02?ie=UTF8&psc=1)
* 2 [potentiomètres rotatif linéaires de 10k](https://www.amazon.fr/gp/product/B07L8TL39B/ref=ppx_yo_dt_b_asin_title_o09_s01?ie=UTF8&psc=1)
* 6 résistances de 10k
* 1 broche femelle IDC 20 pour câble plat/nappe
* 1 [sangle en nylon/polypropylène 250x25x1.4mm](https://www.amazon.fr/gp/product/B07K2DSFY7/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1)
* 1 [boucle de sangle 25mm](https://www.amazon.fr/gp/product/B07426PJ4V/ref=ppx_yo_dt_b_asin_title_o04_s00?ie=UTF8&psc=1)
* 2 [câbles plats/nappes arc-en-ciel 10 fils de 100mm](https://www.amazon.fr/gp/product/B076CLC779/ref=ppx_yo_dt_b_asin_title_o00_s01?ie=UTF8&psc=1)
* 1 câble USB/micro USB
* 1 chargeur USB 2A
* Fil noir 22 AWG
* Fil blanc 22 AWG
* Gaînes thermorétractables de différents diamètres 
* Étain

L'assemblage du Gramophone requiert les outils suivants :

* 1 fer à souder
* 1 petite pince plate
* 1 petite pince coupante
* 1 grosse pince coupante
* 1 petit tournevis cruciforme
* 1 petit tournevis plat
* 1 pince à épiler
* 1 pince à sertir pour connecteur Dupont
* 1 clé plate de 10mm
* 1 aspirateur à étain
* 1 multimètre
* 1 pince à dénuder
* 1 pistolet à colle
* 1 pistolet à chaleur 

<figure>
<img src="img/1.jpg" class="mx-auto d-block" width="80%">
</figure>

### Préparation de la nappe

Prendre les deux câbles plats arc-en-ciel et les placer dans le connecteur correspondant de la manière suivante (respecter l'ordre des couleurs) :

<figure>
<img src="img/2.jpg" class="mx-auto d-block" width="80%">
</figure>

A défaut d'avoir une pince spécialisée, serrer le connecteur à l'aide d'un serre-joint ou d'un étau :

<figure>
<img src="img/3.jpg" class="mx-auto d-block" width="80%">
</figure>

Cette opération doit être effectuée lentement et avec précautions afin de ne pas casser le connecteur.

Préparer les fils des deux nappes de la manière suivante (isolation, dénudage et coupage) :

<figure>
<img src="img/26.jpg" class="mx-auto d-block" width="80%">
</figure>

<figure>
<img src="img/27.jpg" class="mx-auto d-block" width="80%">
</figure>

Noter sur la figure ci-dessus que les fils blancs, noirs et bleus de la nappe de gauche ainsi que le fil jaune de la nappe de droite ont été réservés **sans les connecter** et en les isolants à l'aide de scotch électrique. 

### Préparation des potentiomètres

Tordre les pates (bornes) des potentiomètres afin de faciliter les opérations de soudure sur ces derniers :

<figure>
<img src="img/4.jpg" class="mx-auto d-block" width="80%">
</figure>

À l'aide d'une pince, casser la barre de blocage des potentiomètres :

<figure>
<img src="img/5.jpg" class="mx-auto d-block" width="80%">
</figure>

Souder une résistance de 10k de la manière suivante sur les potentiomètres :

<figure>
<img src="img/6.jpg" class="mx-auto d-block" width="80%">
</figure>

Les résistances n'ayant pas de polarité, leur orientation n'a pas d'importance.

Placer une gaine thermorétractable sur la resistance afin de l'isoler :

<figure>
<img src="img/7.jpg" class="mx-auto d-block" width="80%">
</figure>

### Préparation de l'encodeur

Souder 2 résistances sur le côté de l'encodeur sur lequel apparaît 3 pattes de la manière suivante :

<figure>
<img src="img/8.jpg" class="mx-auto d-block" width="80%">
</figure>

Tresser les deux fils non-soudés des deux résistances afin qu'elles soient connectées entre-elles :

<figure>
<img src="img/9.jpg" class="mx-auto d-block" width="80%">
</figure>

Souder les deux résistances entre-elles au niveau du pli :

<figure>
<img src="img/10.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter la patte centrale du côté de l'encodeur avec 3 pattes à la patte de gauche du côté de l'encodeur avec 2 pattes en soudant un câble ou simplement un fil entre les deux :

<figure>
<img src="img/11.jpg" class="mx-auto d-block" width="80%">
</figure>

### Préparation de la photorésistance

Souder une des pattes de la photorésistance (pas de polarité) à une des pattes d'une résistance de 10k:

<figure>
<img src="img/12.jpg" class="mx-auto d-block" width="80%">
</figure>

Isoler les deux pattes de la photorésistance à l'aide de gaines thermorétractable :

<figure>
<img src="img/13.jpg" class="mx-auto d-block" width="80%">
</figure>

### Préparation du bouton poussoir assignable

Souder une résistance à une des deux pattes d'un des deux boutons :

<figure>
<img src="img/14.jpg" class="mx-auto d-block" width="80%">
</figure>

Raccourcir les pattes de la résistance comme montré sur la figure ci-dessus. 

### Préparation du haut-parleur

Couper un câble blanc et un câble noir d'environ 8cm et les dénuder à leurs deux extrémités : 

<figure>
<img src="img/15.jpg" class="mx-auto d-block" width="80%">
</figure>

Souder le câble noir sur la borne négative du haut-parleur et le câble blanc sur la borne positive :

<figure>
<img src="img/16.jpg" class="mx-auto d-block" width="80%">
</figure>

Sertir les deux autres extrémités des câbles soudés au haut-parleur avec des connecteurs Dupont mâles :

<figure>
<img src="img/17.jpg" class="mx-auto d-block" width="80%">
</figure>

<figure>
<img src="img/18.jpg" class="mx-auto d-block" width="80%">
</figure>

<figure>
<img src="img/19.jpg" class="mx-auto d-block" width="80%">
</figure>

et placer les connecteurs dans un boîtiers de taille correspondante.

### Préparation de la carte TTGO T-Audio

Couper un câble blanc et un câble noir d'environ 5cm, les dénuder des deux côtés, les sertir d'un côté avec des connecteurs Dupont femelles placés par la suite dans un boîtier de taille correspondante :

<figure>
<img src="img/20.jpg" class="mx-auto d-block" width="80%">
</figure>

Souder les deux autres extrémités à l'arrière de la carte TTGO de la manière suivante :

<figure>
<img src="img/21.jpg" class="mx-auto d-block" width="80%">
</figure>

Veiller à ce que les câbles ne se touchent pas entre-eux. Utiliser le multimètre si nécessaire en cas de doute.

Sur le connecteur à 24 pattes de l'autre côté de la carte, couper les deux pattes inférieures et les deux pates supérieures à l'aide de la pince coupante. Après cette opération, le connecteur ne devrait plus avoir que 20 pattes :

<figure>
<img src="img/25.jpg" class="mx-auto d-block" width="80%">
</figure>

Enfin, vérifier que l'interrupteur on/off affleurant au bord de la carte soit sur la position off.

### Préparation de la batterie

Souder le connecteur de batterie fourni avec la carte TTGO à la batterie (fil rouge avec fil rouge, fil noir avec fil noir). Utiliser des gaines thermorétractables pour isoler les soudures. Isoler le fil jaune avec une gaine. Veiller à ne pas connecter le câble noir et le câble rouge lors de cette opération (**danger !!!**).

<figure>
<img src="img/22.jpg" class="mx-auto d-block" width="80%">
</figure>

Sur la photo ci-dessus, deux soudures ont été effectuées pour allonger le câble, en pratique, une seule soudure est nécessaire pour chaque câble dans la mesure où le connecteur de batterie fourni avec les cartes TTGO est assez long.

### Préparation de la coque

Monter les deux potentiomètres, les deux boutons et l'encodeur sur la coque comme suit :

<figure>
<img src="img/23.jpg" class="mx-auto d-block" width="80%">
</figure>

Noter que le bouton placé en bas sur la figure ci-dessus est celui n'ayant pas de résistance.

Placer la photorésistance dans son emplacement et la seller avec de la colle chaude (pistolet à colle) :

<figure>
<img src="img/24.jpg" class="mx-auto d-block" width="80%">
</figure>

### Câblage de l'alimentation

Connecter (souder) avec un câble noir la borne de droite du bouton sans résistance à la borne de gauche du potentiomètre voisin :

<figure>
<img src="img/28.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter avec un câble noir cette même borne du potentiomètre à la borne centrale de l'encodeur :

<figure>
<img src="img/29.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter avec un câble noir à nouveau la borne centrale de l'encodeur à la résistance de la photorésistance voisine :

<figure>
<img src="img/30.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter avec un câble noir à nouveau la résistance de la photorésistance à la borne de gauche du potentiomètre se trouvant à sa droite : 

<figure>
<img src="img/31.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter avec un câble noir cette même borne à la résistance du bouton se trouvant à sa gauche :

<figure>
<img src="img/32.jpg" class="mx-auto d-block" width="80%">
</figure>

Avec un câble blanc, connecter la borne de droite du potentiomètre se trouvant à droite du bouton sans résistance au deux résistances connectées aux bornes de gauche et de droite de l'encodeur voisin :

<figure>
<img src="img/33.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter avec un câble blanc à nouveau les deux résistances de l'encodeur à la borne de droite de la photorésistance voisine :

<figure>
<img src="img/34.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter avec un câble blanc cette même borne à la borne de droite du potentiomètre se trouvant à sa droite :

<figure>
<img src="img/35.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter avec un câble cette même borne à la borne sans résistance du bouton voisin :

<figure>
<img src="img/36.jpg" class="mx-auto d-block" width="80%">
</figure>

### Câblage de la nappe

Connecter le fil jaune de la première nappe à la borne de gauche du potentiomètre se trouvant à droite du bouton sans résistance, le fil vert à la borne centrale et le fil orange à la borne de droite :

<figure>
<img src="img/37.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter le fil violet de la première nappe à la borne de gauche de la résistance et le fil marron de la deuxième nappe à la borne non connectée du côté à deux bornes de l'encodeur :

<figure>
<img src="img/38.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter le fil blanc de la première nappe à la borne de gauche du côté à trois borne de l'encodeur et le fil orange de la deuxième nape à la borne de droite. Connecter également le fil gris de la deuxième nappe à la borne non-connectée du bouton sans résistance :

<figure>
<img src="img/39.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter le fil rouge de la deuxième nappe à la borne centrale du potentiomètre se trouvant à gauche du bouton sur lequel se trouve une résistance. Enfin, connecter le fil noir de la deuxième nappe à la borne de ce bouton sur laquelle se trouve la résistance :

<figure>
<img src="img/40.jpg" class="mx-auto d-block" width="80%">
</figure>

### Assemblage final

Installer le haut parleur sur la coque avec les vis de 2.5mm en veillant à placer une rondelle entre chaque vis et le haut parleur :

<figure>
<img src="img/41.jpg" class="mx-auto d-block" width="80%">
</figure>

Faire ressortir le câble du haut-parleur de l'autre côté de la coque :

<figure>
<img src="img/42.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter la carte TTGO à la nappe de la manière suivante :

<figure>
<img src="img/43.jpg" class="mx-auto d-block" width="80%">
</figure>

Connecter la batterie à la carte TTGO :

<figure>
<img src="img/44.jpg" class="mx-auto d-block" width="80%">
</figure>

Placer la carte TTGO dans la coque, faire passer le fil de la batterie et du haut parleur sur le côté et connecter le fil du haut-parleur aux câbles noirs et blancs soudés précédemment à la carte TTGO. Mettre du scotch électrique pour tenir les deux fiches entre-elles :

<figure>
<img src="img/45.jpg" class="mx-auto d-block" width="80%">
</figure>

Visser la carte à la coque en utilisant deux vis de 2mm séparées de la carte par des rondelles :

<figure>
<img src="img/46.jpg" class="mx-auto d-block" width="80%">
</figure>

Visser le cache de protection du haut-parleur à la coque avec des vis de 2mm. Installer la lanière au cache arrière puis le visser avec des vis de 2mm (attention au détrompeur). Mettre les embouts sur les potentiomètres et l'encodeur :

<figure>
<img src="img/47.jpg" class="mx-auto d-block" width="80%">
</figure>

Le Gramophone est prêt !!!

## Procédure de test du Gramophone

Un numéro de série doit être donné à chaque Gramophone. Ce dernier est indiqué au marqueur indélébile sur la partie intérieure du cache de fermeture du Gramophone. 

Le tableau suivant : <https://docs.google.com/spreadsheets/d/1jJQEU7fEROIA5SLjROb9GM47MD2NmdBlPG9Wnibf0kc/edit?usp=sharing> est utilisé pour répertorier les résultats des tests.

La procédure de test pour chaque Gramophone doit se dérouler de la manière suivante :

* Connecter le Gramophone à l'ordinateur avec le câble USB
* Ouvrir le terminal
* Taper `cd` suivi d'un espace et glisser-déplacer le dossier de test de Gramophone sur le bureau dans le terminal
* Presser la touche "entrée"
* Tapper `make flash` puis presser "entrée"
* Verifier qu'aucun message d'erreur ne soit affiché à la fin de cette étape (*test a*)
* Tourner le bouton de volume du Gramophone à fond puis presser le bouton contrôlé par l'index. Un son doit être entendu (*test b*).
* Vérifier que le potentiomètre de contrôle du volume fonctionne en maintenant le bouton appuyé et en bougeant le potentiomètre en même temps (*test c*).
* Vérifier que le potentiomètre de contrôle de la hauteur du son fonctionne en maintenant le bouton appuyé et en bougeant le potentiomètre en même temps (*test d*).
* Mettre le potentiomètre de contrôle de la hauteur du son au maximum et vérifier que cela active le contrôle de la hauteur du son par la photorésistance en la couvrant (*test e*).
* Vérifier que l'encodeur fonctionne en maintenant le bouton d'activation du son appuyé et en tournant l'encodeur en même temps à droite et à gauche (*test f*).
* Vérifier que l'encodeur fonctionne en maintenant le bouton d'activation du son appuyé et en tournant l'encodeur en même temps à droite et à gauche tout en pressant l'encodeur (*test g*).
* Débrancher le Gramophone de l'ordinateur et vérifier que le bouton de marche et d'arrêt fonctionne (*test h*).
* Charger la batterie pendant 4h puis allumer le Gramophone. Démarrer un chronomètre au moment ou le Gramophone est allumé. Vérifier toutes les 5 minutes que le Gramophone produit du son en appuyant sur le bouton. Lorsque le Gramophone s'arrête de fonctionner (quand la batterie est vide), noter la valeur du chronomètre dans le tableau (*test i*).
* Si le Gramophone passe tous les tests, recharger sa batterie.  
