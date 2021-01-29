# Série d’applications Faust sur le paysage sonore naturel

**Enseignant :** Julien Drobeq

**Intervenant :** Matteo Olivo

Dans le cadre d’une série d’ateliers réalisé avec une classe 4ème du Collège Les Chartreux de Lyon, qui s’est déroulée de janvier à mars 2021, nous avons développé des applications musicales Faust autour du sujet du "paysage sonore naturel". La classe a été divisée en groupes de 4 élèves et chaque groupe a été chargé de créer une composition courte avec ces sonorités, et les autres applications fournies par le Grame.       

## Le thème et les objectifs des applications

Les applications visent à simuler le bruit d’éléments naturels (le feu, la mer) et le son d’instruments musicaux (le djembé, le didgeridoo) qui renvoient, en quelque sorte, à la nature. Les simulations des instruments sont caractérisées par une approche plus dynamique et gestuelle, alors que les simulations des bruits ont un caractère plus méditatif et reposent sur des manipulations minimales des paramètres.
En plus de stimuler la créativité musicale des élèves, chaque application permet également d’aborder des sujets différents concernant la physique du son. Pour cette raison, la série peut également être utilisée dans le cadre de parcours pédagogiques adressés aux lycées.

## Les versions disponibles 

Chaque élève a pu choisir l’instrument avec lequel jouer : le Gramophone, un dispositif portable (smartphone ou tablette) ou le Faust Playground ; dans ce dernier cas l’ordinateur a été amplifié avec des haut-parleurs portables. En effet, les applications de la série sont disponibles en trois versions différentes, adaptées aux trois types d’outils. Le but est de valoriser les diverses possibilités créatives que chaque dispositif met à disposition et de permettre aux participants de choisir le plus adapté à ses propres besoins : le Gramophone, pour ceux qui sont plus à l’aise avec l’interaction et le “geste” ; le smartphone ou la tablette, pour ceux qui veulent explorer la dimension gestuelle mais qui préfèrent contrôler les paramètres du son à travers une surface tactile ; enfin le Faust Playground, pour ceux qui veulent profiter d’une interface plus grande et de la possibilité d’ajouter des effets.

### 1. Didgeridoo

- **Objectifs pédagogiques :** apprentissage de la notion d’effet et du fonctionnement de l’accéléromètre.
- **Fonctionnement :** l’application simule le son du didgeridoo, crée à travers un synthétiseur auquel est appliquée une distorsion pour guitare, la pédale “Wah”. Dans la version pour Gramophone et pour tablette l’angle d’inclinaison de cette pédale est modulé par les mouvements du dispositif, détectés par l’accéléromètre.

Version pour **Gramophone :**
<!-- faust-run -->
```
import("stdfaust.lib"); 
gain = hslider ("[2]volume", 0.5, 0.0, 1.0, 0.001);
wah = hslider ("[1]wah[acc: 0 2 -10 0 10]", 0.5, 0, 1, 0.01);
gate = button("gate[switch:1]");
freq = ba.midikey2hz (hslider ("[0]freq[knob:2]", 23, 23, 26, 1)); 
timbre(freq) = (os.osc (freq) + 0.5 *os.square(2*freq) + 0.25*os.triangle (3*freq))/3;
process = (timbre(freq) : ve.crybaby(wah)) * gain *gate; 
```
<!-- /faust-run -->

Version pour **smartphone/tablette :**
<!-- faust-run -->
```
import("stdfaust.lib");
gate = checkbox ("[2]ON / OFF");
gain = vslider("Volume", 0.8, 0, 1, 0.001) : si.smoo;
freq = ba.midikey2hz (vslider ("[1]Freq_Note (LA, SIb, SI, DO)", 23, 23, 26, 1)); 
wah = vslider ("Wah[acc: 0 3 -10 0 10]", 0.5, 0, 1, 0.001) : si.smoo;
timbre(freq) = (os.osc (freq) + 0.5 *os.osc (2*freq) + 0.25 * os.triangle(3*freq));
process = hgroup ("Digeridoo", (timbre(freq) : ve.crybaby(wah)) * gain) *gate;
```
<!-- /faust-run -->

### 2. La mer et les vagues

- **Objectifs pédagogiques :** apprentissage des bases de la synthèse soustractive.
- **Fonctionnement :** l’application simule le son de la mer et des vagues en utilisant la synthèse soustractive, à partir du bruit blanc et du bruit rose. Il est possible de régler la longueur de la vague (release de l’enveloppe) et la fréquence de coupe des filtres appliqués sur les deux synthétiseurs, en donnant l’impression que la mer et les vagues « s’agitent ». Dans la version pour tablette (ou smartphone) et pour Gramophone, l’activation des vagues se fait par l’accéléromètre en tournant le dispositif autour de l’axe des x.

Version pour **Gramophone :**
<!-- faust-run -->
```
import("stdfaust.lib");
subSynth (ctFreq) = no.pink_noise : fi.lowpass(1, ctfreq1);
ctfreq1 = hslider("cutoff_freq vagues[knob:2]",5500,30,15000,0.01) : si.smoo;
gain = hslider("volume[knob:1]",1,0,1,0.01);
shake_x = hslider("X rotation[acc: 0 1 -10 0 10]", 0, -100, 100, 0.01);
declenche = _ : abs > 75;
gate = shake_x : declenche;
envelope = en.adsr(0.1,0.01,0.9,5,gate)*gain;
subSynth2 = no.noise : fi.lowpass (1, 1700);
process = subSynth2 * 0.04 + (subSynth(ctfreq1) * envelope) <:_,_;
```
<!-- /faust-run -->

Version pour **smartphone / tablette :**
<!-- faust-run -->
```
import("stdfaust.lib");
subSynth (ctfreq1) = no.pink_noise : fi.lowpass(1, ctfreq1); 
gain = hslider("v: [1]VAGUES/[1]volume",1,0,1,0.001) : si.smoo;
ctfreq1 = hslider("v: [1]VAGUES/[2]cutoff",2000,100,15000,0.001) : si.smoo;
rel = hslider ("v: [1]VAGUES/[3]longueur_vague", 3.5, 2.0, 5.0, 0.001) : si.smoo; 
envelope = en.adsr(0.1,0.01,0.9,rel,gate1)*gain;
shake_x = hslider("X rotation [acc: 0 1 -10 0 10]", 0, -100, 100, 0.001);
declenche = _ : abs > 75;
gate1 = shake_x : declenche;
echo = +~ (@(delLenght-1) : *(feedback))
with {
     duration = 0.6; 
     feedback = hslider ("v: [1]vagues/feedback", 0.35, 0, 0.85, 0.01);
     delLenght = ma.SR * duration; 
};
subSynth2 = no.noise : fi.lowpass (1, ctfreq2);
ctfreq2 = hslider("v: [0]MER/[0]fréq cutoff", 1200,100,7000,0.01) : si.smoo;
gain2 = hslider("v: [0]MER/[1]volume",0.08,0,0.5,0.001) : si.smoo;
process =  (subSynth2 * gain2)/2, (subSynth(ctfreq1) * envelope : echo)/2;    
```
<!-- /faust-run -->

### 3. Djembé

- **Objectifs pédagogiques :** apprentissage des concepts de rythme, de vitesse du son percussif et de la structure rythmique d’un morceau.   
- **Fonctionnement :** le son du djembé est créé par la fonction pm.djembe de Faust. Il est possible de choisir de jouer seulement la basse, ou d’ajouter le son tonique et le son claqué. 

Dans la version pour **Gramophone** le réglage du bpm de la percussion est géré par l’accéléromètre (axe des x) : 
<!-- faust-run -->
```
import ("stdfaust.lib");
gain = hslider ("Volume", 0.8, 0, 1, 0.001) : si.smoo;
gate = checkbox ("On / Off[switch:1]");
basse = ba.beat (bpm_basse) : pm.djembe(75, 0.2, 0.3, 1);
tone = ba.beat (bpm_tone) : pm.djembe(300, 0.7, 0.3, 0.7);
slap = ba.beat (bpm_slap) : pm.djembe(550, 0.9, 0.3, 0.4);
s = hslider ("Sel[knob:2]", 0, 0, 2, 1); 
bpm_basse = 60; 
bpm_tone = hslider ("Bpm_tone[acc: 0 0 -10 0 10]", 120, 60, 240, 1) : si.smoo; 
bpm_slap = hslider ("Bpm_slap[acc: 0 0 -10 0 10]", 60, 30, 120, 1) : si.smoo; 
process = (basse, basse + tone, basse + tone + slap) : select3 (s) * gate;
```
<!-- /faust-run -->

Dans les versions pour smartphone / tablette et pour Faust Playground le réglage du bpm de chaque son se fait individuellement.

Version pour **smartphone / tablette :**  

<!-- faust-run -->
```
import ("stdfaust.lib");
basse = vgroup ("[0]Basse", ba.beat (bpm_basse) : pm.djembe (75, 0.2, 0.8, gain_basse) * checkbox ("[1]Play_basse"));
gain_basse = hslider ("[0]Volume_basse", 0.9, 0.0, 1.0, 0.01); 
tone = vgroup ("[1]Tone", ba.beat (bpm_tone) : pm.djembe (300, 0.4, 0.45, gain_tone) * checkbox("[1]Play_tone"));
gain_tone = hslider ("[0]Volume_tone", 0.6, 0.0, 1.0, 0.01); 
slap = vgroup ("[2]Slap", ba.beat (bpm_slap) : pm.djembe (550, 0.7, 0.5, gain_slap) * checkbox("[1]Play_slap"));
gain_slap = hslider ("[0]Volume_slap", 0.3, 0.0, 1.0, 0.01); 
bpm_basse = hslider ("[2]BPM_basse 30 / 60 ", 30, 30, 60, 30);
bpm_tone = 30, 60, 120, 240 : ba.selectn (4, select_tone);
select_tone = hslider ("[2]BPM_tone  30 / 60 / 120 / 240", 0, 0, 3, 1);
bpm_slap = 30, 60, 120, 240 : ba.selectn (4, select_slap);
select_slap = hslider ("[2]BPM_slap  30 / 60 / 120 / 240", 0, 0, 3, 1);
process = hgroup ("DJEMBÉ - SÉQUENCER", basse + tone + slap <:_,_);
```
<!-- /faust-run -->

### 4. Feu
 
- **Objectifs pédagogiques :** apprentissage des notions de bruit blanc, bruit rose et du concept de valeur aléatoire.
- **Fonctionnement :** un oscillateur sinusoïdal, dont la fréquence change de façon aléatoire en fonction d’un générateur de bruit rose, produit la simulation du bruit du feu ; un générateur d’impulsions avec vitesse aléatoire simule les crépitements du bois qui brûle. 

Version pour **Gramophone :**  

<!-- faust-run -->
```
import("stdfaust.lib");
random (n,m) = (1 + no.noise)/2 * (m-n) + n : int; 
gain = hslider ("v:crépitements/volume", 1, 0.1, 1, 0.01);
gate = checkbox ("gate[switch:1]");
echo = +~ (@(delLenght-1) : *(feedback))
with {
     duration = 400 * 0.001;
     feedback = 0.15;
     delLenght = ma.SR * duration;
};
crepit = ba.beat (random (370, 380)) : echo;
feu = os.osc (freqnoise* no.pink_noise);
freqnoise = hslider ("v:feu/freq[knob:2]", 400, 20, 680, 1) : si.smoo;
process = (feu * gate/3), (crepit * 2 * gain * gate);
```
<!-- /faust-run -->

Version pour **smartphone / tablette :** 

<!-- faust-run -->
```
import("stdfaust.lib");
random (n,m) = (1 + no.noise)/2 * (m-n) + n : int; 
gain = hslider ("v:Crépitements/volume", 0.9, 0.1, 1, 0.01);
gate = checkbox ("ON / OFF");
echo = +~ (@(delLenght-1) : *(feedback))
with {
     duration = 400 * 0.001;
     feedback = 0.15;
     delLenght = ma.SR * duration;
};
crepit = ba.beat (random (370, 380)) : echo;
feu = os.osc (freqosc * no.pink_noise);
freqosc = hslider ("v:Feu/intensité flamme", 500, 200, 800, 1) : si.smoo;
ctfreq = hslider ("v:Feu/ctfreq", 300, 40, 700, 1) : si.smoo;
gain2 = hslider ("v:Feu/volume", 1, 0.1, 1, 0.01) : si.smoo;
process = (feu * gate * gain2) : fi.lowpass (1,ctfreq) /1.5, (crepit * gain* gate)/1.5;
```
<!-- /faust-run -->
