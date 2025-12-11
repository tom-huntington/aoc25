Input ← &rs ∞ 0

Numdigits = ⍜°ₑ₁₀(  ÷2 × ⊸ (¬ ◿2) ⌈)
#Factors = ▽⊸=⊸⁅÷↘ 1 +1⊸(⇡ ÷ 2)
AddDim =  ↯˜⊟ 1 ⊸⧻
Rotations = +1 ⇡ ⌊ ÷ 2 ⌈ °ₑ₁₀
GenRotations = ˜↻ ⇌ ⊥ 10 ⟜(AddDim Rotations)
BaseTwoNum = °(⊥₁₀) ⇌


 IsRepeated = ×(↧ 1 /+ = ≡BaseTwoNum ⊸GenRotations) ⟜(>,9)
#rows IsRepeated 13_11

# part 1
#/+ ⊜(/+ × ⊸(= ⊃◿(⌊÷)) ⊸ Numdigits+⊙(⇡+1)⟜- °⊂⊜(⋕)⊸≠@-)⊸≠@, drop¯2 Input

# part 2
/+ ⊜(/+ ≡(× ⊸ IsRepeated) + ⊙(⇡+1)⟜- ° ⊟ ⊜(⋕)⊸≠@-)⊸≠@, drop¯2 Input

