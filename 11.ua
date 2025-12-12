# Experimental!
&rs ∞ 0
⊜(∩□⊙(⊜∘⊸≠@ )°$"_: _")⊸≠@\n
≡°□
˜⊂ "out"
Lookup ←

≡⌞(□⨂ ⊙°□) Lookup # map strings to indices
≡(□≡⌞⊟ ⊙°□) ⊸(⇡⧻) # enumerate to create edge list
°□/(□⊂ ∩°□)       # flatten edge list
⍉°⊚               # edge list to adjacence matrix

PadMatrix ← ⌝↘-⧻Lookup ⊸△
PadMatrix
AdjMat ←

OneHotMat ← PadMatrix°⊚¤˙⊟
ZeroRow   ← ≠ ˜↯ ⊸⇡⧻Lookup
NewAdjMat ← + × AdjMat ⊃ZeroRow OneHotMat
OneHotVec ← = ⇡ ⧻ Lookup

IterMult   ← ⍥(/+× ⊸⊙⍉)∞
CountPaths ← ∪/+ IterMult ⊓OneHotVec NewAdjMat ∩⌞⨂Lookup °⊟
≡CountPaths ["you"_"out" "svr"_"fft" "fft"_"dac" "dac"_"out" "svr"_"dac" "dac"_"fft" "fft"_"out"]
⊙(/+≡/×↯2_3) °⊂ # paths a->b->c=(#paths a->b)*(#paths b->c)
