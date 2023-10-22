## Summary

### Types of probability
#### Marginal
P(X) :  "Probability of X occurring"
#### Conditional
P(X|Y) :  "Probability of X occurring given that Y has occurred"
#### Joint
P(X,Y) ≡ P(X⋂Y) :  "Probability of (both) X and y occurring"
#### Relation between joint, conditional, and marginal 
>          P(Y,X) = P(Y⋂X) = P(X⋂Y) = P(X,Y) = P(X|Y)·P(Y)

### Chain Rule
>          P(X₁,…,Xₙ) = ∏ᵢ₌₁,ₙ P(Xᵢ|X₁,…,Xᵢ₋₁)

### Bayes' Theorem
>          P(X|Y) =  P(Y|X)·P(X)
>                    ———————————
>                        P(Y)

### Independency
If X and Y are independent:
>          P(X,Y) = P(X)·P(Y)
>          P(X|Y) = P(X) 
