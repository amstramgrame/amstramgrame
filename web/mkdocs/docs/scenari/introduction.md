# Introduction
	
## Vue d’ensemble
  
Le projet Amstramgrame a pour but de favoriser l’apprentissage de concepts scientifiques liés aux **mathématiques, à la physique et à l’informatique** par des applications concrètes dans des domaines artistiques comme la musique (ex. lutherie, composition et musique d’ensemble), la danse (geste chorégraphié), etc. Pour ce faire, Amstramgrame s’appuie sur 3 outils :

* **des scénarii pédagogiques** courts exécutables en moins de 2h donnant des pistes de travail aux enseignants issus de plusieurs disciplines (ex. musique, mathématiques, physique, etc.) présents sur le site web ;

* **le langage de programmation Faust** (<https://faust.grame.fr>) intégré directement dans le site web ;

* **le "[Gramophone](../../tools/gramophone)"** - instrument de musique entièrement programmable en Faust et qui permet de rendre tangible les concepts abstraits étudiés dans les différents scénarii présentés sur le site web.

Des valises de 30 Gramophones sont mise à disposition dans les établissements scolaires. Le projet nécessite également l’utilisation d’ordinateurs sur place pour accéder au site web d’Amstramgrame et pour programmer les Gramophones. Les thèmes des scénarios sont modulaires afin qu’ils puissent être abordés dans le contexte de différents cours (ex. maths, physique, techno, musique, etc.). Des idées de projets pluridisciplinaires alliant les compétences acquises dans les différents scénarios pédagogiques sont également proposées sur le site web d’Amstramgrame. L’ensemble des programmes étudiés dans les scénarii d’AmstramGrame peuvent également être transformés en applications pour smartphone Android afin que les établissements n’ayant pas accès au Gramophones puissent bénéficier d’une alternative.

## C'est quoi le code ?

La notion de programme informatique est au cœur de la révolution numérique. Nous interagissons au quotidien avec des programmes informatiques, que ce soit sous la forme d’applications pour smartphones, d’assistance dans les voitures, d’objets connectés ou encore de pages web. Or derrière chaque programme informatique se cache un ensemble d’instructions qui le constituent : **le code.**

Il existe une grande variété de manières de programmer. Depuis FORTRAN, le premier langage de programmation de haut niveau créé en 1954, leur nombre n’a cessé d’augmenter, chacun développant sa syntaxe propre. Tandis que certains privilégient une approche généraliste, d’autres sont conçus à des fins spécifiques, comme par exemple les langages utilisés en bourse et dans le domaine de la finance. Beaucoup de langages de programmation sont dit open-source, c’est-à-dire dont le code est ouvert et libre d’accès. Parmi les langages de programmation les plus populaires en 2020, on trouve :

<!-- TODO: peut être ajouter des liens vers chaque langage -->
 
* Java
* Javascript
* Python
* C 
* C++ 

On discerne deux grandes familles de langages de programmation, aussi appelées "paradigmes" : les **langages fonctionnels** et les **langages impératifs**. La programmation fonctionnelle d’abord, par laquelle on compose un problème sous la forme d’un ensemble de fonctions mathématiques à exécuter, traduites dans un second temps dans le langage de la machine (on parle alors de compilation). Elle facilite la compréhension par du code court et expressif, et produit peu de bugs. L’autre famille de programmation est dite impérative (ou procédurale), et permet d’écrire du code qui décrit exactement et en détail les étapes que l’ordinateur doit effectuer pour atteindre l’objectif, sans étape de traduction dans le langage de la machine. Bien que la plupart des langages aient été conçus pour prendre en charge un paradigme de programmation spécifique, de nombreux langages généraux sont suffisamment flexibles pour passer de l’un à l’autre.

À l’instar de nombreux pays comme les États-Unis, l’Angleterre ou encore l’Allemagne, la France a choisi d’inscrire le codage informatique dans les programmes scolaires dès le collège. <!-- TODO: je trouve cette phrase un peu bizarre : est-ce vraiment vrai ? Il faudrait peut être une référence ? -->
Depuis la rentrée 2016, les professeurs des écoles et enseignants doivent initier les élèves à la programmation informatique, dans le but de développer leur sens logique et leur capacité à découper un problème en sous-problèmes. <!-- TODO: et pas que... C'est un peu réducteur comme vision. -->
Au lycée, en Enseignement du Numérique et Sciences Informatiques de première générale, le langage Python est utilisé. Ce langage est simple d’usage, concis, libre et gratuit, largement répandu, riche de bibliothèques adaptées et bénéficie d’une vaste communauté de développeurs. Pourtant, le projet Amstramgrame s’appuie sur l’utilisation de Faust. Pourquoi ?

## Pourquoi Faust ?

<!-- TODO: c'est un peu limite cette section, je pense qu'on peut améliorer mais pour l'instant ça fera l'affaire. -->

[**Faust (Functional Audio Stream)**](https://faust.grame.fr) est un langage de programmation fonctionnel développé principalement à Grame, et destiné spécifiquement à la **création sonore.** Il est né en réponse à un besoin qui émerge dès les années 1950 : disposer d’un "vocabulaire" adapté pour décrire des procédés musicaux de synthèse et de traitement du son dans toute leur complexité. 

Faust propose pour ce fait une sémantique simple et rigoureuse, et des techniques de compilation sophistiquées rendant accessible à des artistes, des réalisateurs en informatique musicale, etc., sans connaissance en programmation, des développements qui nécessitaient traditionnellement l’emploi de langages complexes comme C ou C++. Faust se différencie en effet des autres langages musicaux par le fait qu’il est compilé (c’est-à-dire traduit directement dans le langage de la machine) plutôt qu’interprété. Cela lui permet d’exprimer des calculs fonctionnant à l’échantillon près pouvant fonctionner sur toutes sortes de plateformes. Ainsi, Faust offre une alternative plus simple et plus efficace à Python pour, par exemple, programmer des plug-ins audios, des applications musicales, etc.

Le projet Amstramgrame privilégie donc Faust pour son efficacité dans la création sonore. Mais un apprenti codeur aura tout intérêt à varier les langages de programmation qu’il utilise selon ses projets, à la manière des langues vivantes où il serait inconcevable, au siècle où nous vivons, de vouloir s’obstiner à ne parler qu’une seule langue. En outre, l’apprentissage du code est une manière de passer du statut de simple utilisateur, limité par ce que le marché lui propose, au statut de citoyen éclairé et autonome dans ses usages, capable de répondre lui-même à ses besoins liés à l’informatique.

## Découvrez le Gramophone

* [Le Gramophone](../../tools/gramophone) a été spécialement conçu dans le cadre du projet Amstramgrame. C’est un instrument entièrement programmable en Faust et complètement indépendant (il peut fonctionner sous batterie)
* La Gramophone abrite différents types de capteurs tel que des accéléromètres, un gyroscope, un potentiomètre, une boussole numérique, un capteur de lumière, des capteurs de force, etc.
* Il est basé sur un microcontrolleur (ESP-32) et il bénéficie directement des derniers développements sur les systèmes embarqués menés par [l’équipe de recherche de Grame](TODO).
* Pour être programmé, le Gramophone doit être connecté à un ordinateur via un câble USB qui sert également au chargement de sa batterie (de la même manière qu’un téléphone portable).
* Il est nécessaire d’[installer une application](TODO) (compatible pour Windows, MacOS et Linux) sur les machines utilisées pour programmer les Gramophones (ce qui devra donc être prévu par les établissement d’accueil).
* Plus d'informations sur les gramophones peuvent être trouvées sur [la page correspondante sur ce site](../../tools/gramophone).
