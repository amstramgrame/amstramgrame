# L'application GramoLoader

L'application GramoLoader permet de facilement installer des programmes écrits avec le [langage de programmation Faust](../faust/about.md) sur le Gramophone. Elle a été spécialement conçue pour être utilisée en tandem avec le [Faust Web IDE](../faust/ide.md) ou le [Faust Playground](../faust/playground.md) (voir le tutoriel [Programmer le Gramophone](programming.md)).

<figure>
<img src="img/loader.jpg" class="mx-auto d-block" width="50%">
</figure>

## Fonctionnement

Le [Faust Web IDE](../faust/ide.md) et le [Faust Playground](../faust/playground.md) génèrent un fichier appelé `binary.zip` lorsque le bouton "Gramophone" est pressé. Une fois téléchargé sur l'ordinateur (généralement dans le dossier téléchargement), ce fichier peut être sélectionné avec l'application GramoLoader en cliquant sur le bouton "Sélectionner un fichier" pour le transmettre au Gramophone :

<figure>
<img src="img/loader-usage.svg" class="mx-auto d-block" width="100%">
<center><figcaption>Programmation du Gramophone</figcaption></center>
</figure>

Pour que cela fonctionne (ou en mode programmation si le mode neutre ne fonctionne pas), il est nécessaire que le Gramophone soit connecté à l'ordinateur avec un câble USB et [qu'il soit mis en mode programmation](about.md#mode-programmation).

Une fois sélectionné, toute nouvelle version de `binary.zip` étant téléchargée sur l'ordinateur sera automatiquement envoyée au Gramophone. **L'application GramoLoader doit rester ouverte pour que cela fonctionne.**

Le bouton "Réessayer" permet de réinitialiser l'envoi de `binary.zip` au Gramophone. Le bouton "QUITTER" permet de quitter l'application.

**Attention:** Avant de générer un nouveau fichier `binary.zip`, il faut d'abord supprimer l'ancien. Sinon, le nouveau fichier s'appellera `binary(1).zip` et ne fonctionnera pas sur le GramoLoader. Le fichier utilisé doit donc obligatoirement s'appeler `binary.zip`.

## Téléchargement/Installation

L'application GramoLoader est téléchargeable gratuitement depuis ce site et est disponible pour Windows, MacOS et Linux.

### Windows

[**>> Télécharger GramoLoader pour Windows <<**](https://github.com/amstramgrame/amstramgrame/raw/master/gramophone/autoloader/bin/windows/GramoLoader.exe)

Sous Windows, GramoLoader se présente sous la forme d'un fichier `.exe`. Ce dernier peut être placé n'importe où sur l'ordinateur. Il suffit de le lancer pour démarrer l'application.

**En cas de problème :** Il peut arriver sur certains ordinateurs sous Windows que le Gramophone ne soit pas reconnu (ex. le GramoLoader affiche un message indiquant qu'il est impossible de se connecter au Gramophone). Cela est probablement dû au fait que le driver USB correspondant n'est pas installé. Dans ce cas, installer [le driver](https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers) devrait résoudre le problème. 

### MacOS

[**>> Télécharger GramoLoader pour MacOS <<**](https://github.com/amstramgrame/amstramgrame/raw/master/gramophone/autoloader/bin/macos/GramoLoaderMac.zip)

[**>> Télécharger GramoLoader pour MacOS 10.14 <<**](https://github.com/amstramgrame/amstramgrame/raw/master/gramophone/autoloader/bin/macos/GramoLoaderMac14.zip) (Version temporaire résolvant un bug)

Sous MacOS, GramoLoader se présente sous la forme d'un fichier `.app`. Ce dernier peut être placé n'importe où sur l'ordinateur (dans le dossier "Applications", par exemple). Il suffit de le lancer pour démarrer l'application.

**En cas de problème :** Il peut arriver sur certains Mac que le Gramophone ne soit pas reconnu (ex. le GramoLoader affiche un message indiquant qu'il est impossible de se connecter au Gramophone). Cela est probablement dû au fait que le driver USB correspondant n'est pas installé. Dans ce cas, installer [le driver](https://www.silabs.com/documents/public/software/Mac_OSX_VCP_Driver.zip) devrait résoudre le problème. 

### Linux (Sources)

Il n'existe pas de version pré-compilée de GramoLoader pour Linux. À l'inverse, [les sources de l'application](https://github.com/amstramgrame/amstramgrame/raw/master/gramophone/autoloader/bin/linux/GramoLoader.zip) peuvent être utilisées puis lancées en ligne de commande avec :

```
python3 src/FlashAppAsync.py
``` 
