Empirical Risk Minimization, Least Squares

one of the most studied techniques...

>                    ___L(f)___
>           min   𝔼[ ℓ(y,f(x)) ]
>          f x→y
>
>          given S = ()
given a training set (can't read math notation)

(Expectation value in this case is trying to say 
that prediction for more common events is more 
important for less common... so its like a weighted sum)

There is no way to do this exactly, we will have to 
approximate it

What is an algorithm?

A map that given the data is going to return some function

hat denotes empirical .... ¿?¿?

we would like a solution whose test error is close to the best possible test error

there is no solution, computing this is hard or impossible
We don't the expectation

Gradient descent might be a possible algorithm...

1. lets look at a space of possible solutions, Hypothesis space

in here we will replace ℓ(f) with empirical risk

2. 𝓛(f) = (1/n)·( ∑i=1_n ℓ(yᵢ,f(xᵢ)) ) 

> 
>           min   (1/n)·( ∑i=1_n ℓ(yᵢ,f(xᵢ)) ) 
>          f ∈ H
>

There is a tension, we want H to be as large as possible, but also manageable

**important point** Rather than replacing the objective function 
with another empirical function you can compute from the data, we will
replace the gradient of that function with an empirical approximation

we describe the two different approaches...

optimization might guide the search, things like projection might guide the search

first lets take the hypothesis space H to be linear functions ...

H : { f:X→ℝ | f(x) = wᵀx }  
... there exists a w for which I can do this for every x 




