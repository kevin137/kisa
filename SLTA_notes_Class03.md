## Notes from 9.520/6.860: Statistical Learning Theory and Applications - Class 3
https://www.youtube.com/live/MiypgGqEPpQ?si=IesOs32QuPPaVSZo
> Prof. Lorenzo Rosasco, University of Genoa / MIT
> 
### Empirical Risk Minimization (Least Squares)

Known by many names, M estimation in statistics

One of the most studied prinicples to develop algorithms
in machine learning. Probably most classical and simple
instantiation, interesting because despite looking at
super complicated nonlinear models like neural networks, 
when you want to try to understand what's going on you 
often actually go back to this. Surprising number of 
papers in the last 12 months on linear least squares
attempting to explain things you see in much more 
complicated models.

#### Initial definitions

>                        ___L(f)___
>           min    𝔼ₓ,ᵧ[ ℓ(y,f(x)) ]
>          f: x→y
>
>          given Sₘ = (xₐ,yᵢ)?ᵐ  maybe from last video?

...given a just training set which is a finite set of 
input-output pairs. 

(Expectation value in this case is 
trying to say that prediction for more common events is 
more important for less common... so its like a weighted sum)
Assuming i.i.d. "Independent and identically distributed 
random variables", this can be relaxed in some cases. Assuming 
that the data all come from the same distribution
is much more crucial. The distribution they are coming
from actually defines the objective.
(Sidetrack on sequential predection where this is not true)

There is no way to do this exactly, we will have to 
approximate it.

#### What is an algorithm?

A map that given the data is going to return some function

>          Sₛ ⟼ ^f = f^ₛₘ ≈ fₚ
>          L(^f) ≈ L(fₚ)

( ^f  as in "f hat"; hat means it depends on the data, both the 
cardinality and the specific instance, fₚ the exact minimizer
of these overall possible functions )

We would like a solution whose test error is close to the 
best possible test error. 

There is no solution, for at least two reasons

1. There is no expectation, the computation of it extremely
   hard or impossible
2. The function space is too big

_Gradient descent might be a possible algorithm, if we knew
some more things_

>          (1)    𝓗 ⊂ { f | X ⟶ ℝ }

( we are keeping to the reals for now, in other words, a 
space for which the expectation is well-defined )

> Hypothesis space
Let's look at a space of possible solutions, the hypothesis space

in here we will replace ℓ(f) with empirical risk

>          (2)    L^(f) = (1/n)·( ∑i=1:n ℓ(yᵢ,f(xᵢ)) ) 

>                   min   (1/n)·( ∑i=1:n ℓ(yᵢ,f(xᵢ)) ) 
>                  f ∈ H

We are in good shape, we have access to everthing, the data 
the loss function and the space. There is a tension, we want 
H to be something manageable, yet as big as possible to not
restrict the search for solutions.

**important point** Rather than replacing the objective function 
with another empirical function you can compute from the data, the 
other typical approach is to replace the gradient of that function 
with an empirical approximation. Can also do things like the
stochastic gradient, where you take the gradient of just one point. 

We will describe the two different approaches, replacing 
the gradient or replacing the objective function; they are both ways
to explore the possible space of solutions. Things like optimization 
and projection might guide the search.

To continue we will make some specfic choices

First let's take the hypothesis space H to be linear functions ...

H : { f:X→ℝ | f(x) = wᵀx }  X: ℝᵈ

... there exists a w for which I can do this for every x 

once I do this, I can replace the idea of function, 
which is a very long list of association of numbers,
with vectors, which is a list of d numbers. 
This is simple, but this is the foundation of any other 
model: feature maps, kernel, neural networks

We will eventually replace "this" ℓ with the square loss function

Now we can start identifying H with ℝᵈ
> H ≃ ℝᵈ

we can talk about things like what is the norm of the function in H:
> ∥f∥_H = ∥w∥

we can define an inner product:
> ⟨f,f'⟩_H = wᵀw'

(Note: they sometimes use the ⟨⟩ notation in the
 course to denote infinite objects)

We love this model because instead of thinking
about the function you can think about the sum
of vectors and do all the stuff you do for vectors.
It's clearly a linear space,
It clearly has an inner product,
a norm, a distance, everything you want
You can talk about orthogonality and basically
every problem we're going to discuss is going to
become essentially a linear algebra or calculus
problem.

With this choice in mind the least squares problem becomes:

>              min   (1/n)·( ∑i=1:n (yᵢ - wᵀxᵢ)² ) 
>             w ∈ ℝᵈ

> We don't introduce the offset, it's very easy to plug it
> back in and in high dimension, it really doesn't matter 
> too much.

This problem is very related to linear algegra, so it's 
very useful to rewrite it in linear algebra notation:
>          ^Xₙₓᵈ = ( x₁ … xₙ )ᵀ 
>          ^yₙₓ₁ = ( y₁ … yₙ )ᵀ 

Now we can rewrite the problem as a quadratic residual:
>              min   (1/n)·( ∑i=1:n ∥^Xw - ^y)∥² ) 
>             w ∈ ℝᵈ

The story until now was a learning-related story, now it
could go in a couple of directions:
1. Prove using statistical/probabilistic tools that it is valid
2. What is this from a computational point of view?

For the moment we can forget about the statistical viewpoint...

#### Least squares problem associated with a linear system

>          ^X·w = ^y

Linear systems can be in two situations:

##### 1: n > d  
   (over-determined linear system of equations) 
   from a machine learning point of view, an 
   under-parameterized model, the number of parameters 
   is smaller than the number of datapoints
   (here we assuming that the columns are linearly
    independent, or d columns are full rank)

![n > d](/SLTA_notes_Class03_n_gt_d.png)

How do we solve this system? We take the gradient of expression 
from before
>             (1/n)·( ∥^X·w - ^y)∥² ) 

set it equal to zero, and solve

>             ∇( (1/n)·( ∑i=1:n ∥^X·w - ^y)∥² ) = 0 
>
>             2·^Xᵀ(^Xw - ^y) = 0
>
>             ^Xᵀ·^X·w = ^Xᵀ·^y
>
>             w = (^Xᵀ·^X)⁻¹(^Xᵀ·^y)

##### 2: n < d

![n < d](/SLTA_notes_Class03_n_lt_d.png)

