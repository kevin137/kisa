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

>          Sₛ ⟼ ^f = ^fₛₘ ≈ fₚ
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
about the functions you can think about
of vectors and do all the stuff you do for vectors.
It's clearly a linear space,
it clearly has an inner product,
a norm, a distance, everything you want.
You can talk about orthogonality and basically
every problem we're going to discuss is going to
become essentially a linear algebra or calculus
problem.

With this choice in mind the least squares problem 
(using square loss function) becomes the following 
minimization:

>              min   (1/n)·( ∑i=1:n (yᵢ - wᵀxᵢ)² ) 
>             w ∈ ℝᵈ

We don't introduce the offset, it's very easy to plug it
back in and in high dimension, it really doesn't matter 
too much.

This problem is very related to linear algegra, so it's 
very useful to rewrite in linear algebra notation:

>          ^Xₙₓᵈ = ( [x rowᵈ]₁ … [x rowᵈ]ₙ )ᵀ 
>          ^yₙₓ₁ = ( y₁ … yₙ )ᵀ 

Now we can rewrite the problem as the minimziation of 
this  quadratic residual:

>              min   (1/n)·( ∑i=1:n ∥^Xw - ^Y)∥² ) 
>             w ∈ ℝᵈ

The story until now was a learning-related story, now it
could go in a couple of directions:
1. Prove using statistical/probabilistic tools that it is valid
2. What is this from a computational point of view?

For the moment we can forget about the statistical viewpoint...
this is now a linear algebra problem

#### Least squares problem associated with a linear system

>          ^X·w = ^Y

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
>             (1/n)·( ∥^X·w - ^Y)∥² ) 

set it equal to zero, and solve

>             ∇( (1/n)·( ∑i=1:n ∥^X·w - ^Y)∥² ) = 0 
>
>             2·^Xᵀ(^Xw - ^Y) = 0
>
>             ^Xᵀ·^X·w = ^Xᵀ·^Y
>                                note that ^Xᵀ·^X is dxd,
>                                we can invert it 

###### Solution for w

>             w = (^Xᵀ·^X)⁻¹(^Xᵀ·^Y)

because (the outermost operator, outside of the norm) is just a 
square I'm just gonna get optimality conditions that are linear 
and I get a linear system I solve this linear system, and that's
it.

##### 2: n < d

Consider now the situation where n is much smaller than d

![n < d](/SLTA_notes_Class03_n_lt_d.png)

The space of variables is actually larger than the space of data,
so I can see the space of data as a subset of the larger space ℝᵈ.
Assuming now n is smaller than d and n is full rank (the rows are 
linearly independent) 

At this point I don't have the problem that a solution might not
exist, it does exist. What might happen is that multiple solutions 
might exist. So now I need to have a selection criteria, and the 
classical one is: consider among all the possible solutions to the
system, the one with the minimum norm.

>              min ∥w∥² subject to  ^Xw = ^Y 

**important** this will around multiple times during this course

How do we find the solution in this case? It is more annoying 
because we can't just take the gradient and set to zero...

Set up Lagrange multipliers, set ^Xw = ^y up as a constraint and
set the rearity¿? of that equal to zero.

New objective function:

>              ∥w∥² + λ·αᵀ(^Xw - ^Y)

Working through this, we get:

###### Solution for w

>              ^w = ^Xᵀ(^X·^Xᵀ)⁻¹·^Y

Again we are assuming that the rows are linearly independent,
so that when we build the ^X·^Xᵀ this matrix is now n by n so we 
can assume it is invertible and we get this previous equation.

Now some insider baseball in response to a question about
different kinds of norms...
What we just did is the simple example because it's the square,
you take derivative and it's nice, but say in the last 10 years 
people, I guess from 2000 to 2010, people were obsessed with the 
L1 norm. You can use entropy here you can use a lot of different 
things and you can use things that are not norms you can use
functions that you like. This is the place where, if you like
the loss function, you have to make a design choice, and and what 
we did before is a design choice and we're gonna call this a prior 
and we're gonna see that this actually makes a lot of difference 
depending what you put here.

The thing that we just discovered is called the "pseudoinverse".

----- stopping for the night at 34:23

#### Pseudoinverse of the least squares problem

_Moore-Penrose Pseudoinverse_ [wikipedia](https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse)

>          ^w = (^X†)^Y
> 
>          ^X† = (^Xᵀ·^X)⁻¹·^Xᵀ    for n > d (independent columns)
> 
>          ^^X† = ^Xᵀ(^X·^Xᵀ)⁻¹    for n < d (independent rows)

_Note: the notation is getting squirelly, so here's the same 
thing in LaTeX for clarity:_

  ```math
    \begin{multline}
      \begin{split}
        \hat{w} &= \hat{X}^{\dagger}\hat{Y} \\
        \hat{X}^{\dagger} &= (\hat{X}^{T}\hat{X})^{-1}\hat{X}^{T} 
        \hspace{12pt} \text{ for n > d, (independent columns) } \\ 
        \hat{X}^{\dagger} &= \hat{X}^{T}(\hat{X}\hat{X}^{T})^{-1}
        \hspace{12pt} \text{ for n < d, (independent rows) } \\ 
      \end{split}
    \end{multline}
  ```
Observations:
1. The computational cost of inverting the matrix to calculated
   the n > d case, is the size of the matrix cubed, plus some
   other stuff, so a total cost of d³ + nd²
2. For the n > d case, it is n³ + d²n
3. Starting with ^w = ^Xᵀ(^X·^Xᵀ)⁻¹·^Y, what is the
   size/dimension of the "(^X·^Xᵀ)⁻¹·^Y" part? It is an
   n-dimenstional vector, so we will give it a name: C

>          ^w = ^Xᵀ(^X·^Xᵀ)⁻¹·^Y
>             = ^Xᵀ·C
>             = ∑_i:1:n xᵢ·cᵢ   ∈ NullSpace(^Xᵀ)

The "w" are linear combinations of the input power, we will 
call this the representor theroem, and it is the way to build 
non-parametric models through kernels.
          
>          ^f†(x) = ^xᵀ·^w†
>                 = ∑_i:1:n xᵢᵀ·xᵢ·cᵢ 

Can view this as a linear combination or a kind of correlation 
between the new input and the input points, think of this 
inner product as some kind of similarity, not really because 
they're not normalized, but a kind of the angle related to the 
angle between my vectors. In other words, a weighted combination 
of the similarites where here the similarity is just the inner
product.

What do these solutions actually look like? 

>          ^X·w = ^Y

Anything in the null space of X is going to be another solution...

>          ^w† + w₀   w₀ ∈ NullSpace(^X)

_Null Space_ [wikipedia](https://en.wikipedia.org/wiki/Kernel_(linear_algebra))

Remember you can decompose the space in the null space of X 
and the range of Xᵀ, that's a basic theorem in calculus. 
This shows that ^w† belongs to the range of Xᵀ† 

Another point, we chose the only vector(s) orthogonal to the 
null space of the matrix. So, you can think in terms of minimum norm,
or you can think in terms of your tunnel to this space, it's all the 
same and again this is all just big recap of linear systems because 
we're actually going to build quite a bit on this in all sorts of ways









