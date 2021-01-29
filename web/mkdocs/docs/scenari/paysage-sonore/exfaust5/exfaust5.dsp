
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

