import Game.Levels.LessOrEqual.L07or_symm

World "LessOrEqual"
Level 8
Title "x ≤ y or y ≤ x"

namespace MyNat

LemmaDoc MyNat.le_total as "le_total" in "≤" "
`le_total x y` is a proof that `x ≤ y` or `y ≤ x`.
"

NewLemma MyNat.le_total

Introduction "
This is I think the toughest level yet.
"

/-- If $x \leq y$ and $y \leq z$, then $x \leq z$. -/
Statement le_total (x y : ℕ) : x ≤ y ∨ y ≤ x := by
  Hint (hidden := true) "Start with `induction y with d hd`."
  induction y with d hd
  right
  exact zero_le x
  Hint (hidden := true) "Try `cases hd with h1 h2`."
  cases hd with h1 h2
  left
  cases h1 with e h1
  rw [h1]
  use e + 1
  rw [succ_eq_add_one, add_assoc]
  rfl
  Hint (hidden := true) "Now `cases h2 with e h2`."
  cases h2 with e h2
  Hint (hidden := true) "You still don't know which way to go, so do `cases e with a`."
  cases e with a
  rw [h2]
  left
  rw [add_zero]
  use 1
  exact succ_eq_add_one d
  right
  use a
  rw [add_succ] at h2
  rw [succ_add]
  exact h2

LemmaTab "≤"

Conclusion "
A passing mathematician remarks that with you've just proved that `ℕ` is totally
ordered.
"

-- **TODO** add "if you want to prove it's a totally ordered ring, go
-- to advanced mult world"
