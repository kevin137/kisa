## Notes from 9.520/6.860: Statistical Learning Theory and Applications - Class 3
> Prof. Lorenzo Rosasco, University of Genoa / MIT

[video](https://www.youtube.com/live/MiypgGqEPpQ?si=IesOs32QuPPaVSZo)

[lecture notes](https://github.com/sebastiani/6.860-Statistical-Learning-Theory/blob/master/lectures/lecture3_regularized_least_squares/Class03_RLS.pdf) (from a slightly later class)

### Empirical Risk Minimization (with the Least Squares loss function )

_ERM with the least squares loss function is also called 
ordinary least squares (OLS) {from the lecture notes}_ 

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
>          given Sₙ = (xᵢ,yᵢ)₁ⁿ  ~ Pⁿ

With Sₙ being the training set which is a finite set of 
input-output pairs (which is approximating a perfect 
probabilistic expression of the population statistics,
my words...)

(The expectation value in the expression above is 
trying to say that prediction for more common events is 
more important for less common... so its like a weighted sum)

Side remark, this is assuming i.i.d. 
"Independent and identically distributed random variables". 
This requirement can be relaxed in some cases. 
Assuming that the data all come from the same distribution 
is much more crucial. The distribution they are coming from 
actually _defines_ the objective.
(Sidetrack on sequential predection where this is not true)

There is no way to do this exactly, we will have to 
approximate it.

#### What is an algorithm ?

A map that given the data is going to return some function

>          Sₙ ⟼ ^f = ^f_Sₙ ≈ fₚ
>          L(^f) ≈ L(fₚ)

( ^f  as in "f hat"; hat means an empirical quantity, a 
quantity that _depends on the data_, both the 
cardinality and the specific instance. fₚ is the 
theoretical function that would be the exact minimizer
of these overall possible functions )

We would like a solution whose test error is close to the 
best possible test error. 

There is no solution, for at least two reasons:

1. There is no expectation, the computation of it extremely
   hard or impossible
2. The function space is too big

_Gradient descent might be a possible algorithm, if we knew
some more things_

#### Hypothesis space

>          (1)    𝓗 ⊂ { f | X ⟶ ℝ }

( we are keeping to the reals for now, in other words, a 
space for which the expectation is well-defined )

Let's look at the space of possible solutions, the 
hypothesis space, and now let's look inside for a 
smaller space

in here we will replace ℓ(f) with empirical risk

>          (2)    ^L(f) = (1/n)·( ∑i:1:n ℓ(yᵢ,f(xᵢ)) ) 

so, we are looking for this function f() to minimize the
loss function

>                   min   (1/n)·( ∑i:1:n ℓ(yᵢ,f(xᵢ)) ) 
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

To continue we will make some specfic choices, 

First let's take the hypothesis space H to be linear functions ...

H : { f:X→ℝ | f(x) = wᵀx }  X: ℝᵈ

... there exists a w for which I can do this for every x 

once I do this, I can replace the idea of function, 
which is a very long list of association of numbers,
with vectors, which is a list of d numbers. 
This is simple, but this is the foundation of any other 
model: feature maps, kernel, neural networks

We will eventually replace the ℓ with the square loss function

Now we can start identifying H with ℝᵈ
> H ≃ ℝᵈ

So now we can talk about things like what is the norm 
of the function in H:
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

>              min   (1/n)·( ∑i:1:n (yᵢ - wᵀxᵢ)² ) 
>             w ∈ ℝᵈ

We don't introduce the offset, it's very easy to plug it
back in and in high dimension, it really doesn't matter 
too much.

This problem is very related to linear algebra, so it's 
very useful to rewrite in linear algebra notation:

>          ^Xₙₓᵈ = ( [x rowᵈ]₁ … [x rowᵈ]ₙ )ᵀ 
>          ^Yₙₓ₁ = ( y₁ … yₙ )ᵀ 

Now we can rewrite the problem as the minimziation of 
this quadratic residual:

>              min   (1/n)·( ∑i:1:n ∥^X·w - ^Y∥² ) 
>             w ∈ ℝᵈ

The story until now was a learning-related story, now it
could go in a couple of directions:
1. Prove using statistical/probabilistic tools that it is valid
2. What is this from a computational point of view?

For the moment we can forget about the statistical viewpoint...
this is now a linear algebra problem, particularly a...

#### Least squares problem associated with a linear system

>          ^X·w = ^Y

Linear systems can be in two situations:

##### Linear system situation 1: n > d  
   (over-determined linear system of equations) 
   from a machine learning point of view, an 
   under-parameterized model, the number of parameters 
   is smaller than the number of datapoints
   (here we assuming that the columns are linearly
    independent, or d columns are full rank)

![n > d](/SLTA_notes_Class03_n_gt_d.png)
>             ∄^w s.t. (such that) ^X·w = ^Y


How do we solve this system? We take the gradient of expression 
from before
>             (1/n)·( ∥^X·w - ^Y)∥² ) 

set it equal to zero, and solve

>             ∇( (1/n)·( ∑i:1:n ∥^X·w - ^Y)∥² ) = 0 
>
>             2·^Xᵀ(^Xw - ^Y) = 0
>
>             ^Xᵀ·^X·w = ^Xᵀ·^Y
>                                note that ^Xᵀ·^X is dxd,
>                                so we can invert it 

###### Solution of w for n > d

>             w = (^Xᵀ·^X)⁻¹·^Xᵀ·^Y

because (the outermost operator, outside of the norm) is just a 
square I'm just gonna get optimality conditions that are linear 
and I get a linear system I solve this linear system, and that's
it.

##### Linear system situation 2: n < d

Consider now the situation where n is much smaller than d

![n < d](/SLTA_notes_Class03_n_lt_d.png)
>             ∃^w s.t. (such that) ^X·w = ^Y

The space of variables is actually larger than the space of data,
so I can see the space of data as a subset of the larger space ℝᵈ.
Assuming now n is smaller than d and n is full rank (the rows are 
linearly independent) 

At this point I don't have the problem that a solution might not
exist, it does exist. What might happen is that multiple solutions 
might exist. So now I need to have a selection criteria, and the 
classical one is: consider among all the possible solutions to the
system, the one with the **minimum norm**.

>               min   ∥w∥² subject to  ^Xw = ^Y
>              w ∈ ℝᵈ

**important** this will around multiple times during this course

How do we find the solution in this case? It is more annoying 
because we can't just take the gradient and set to zero...

Set up Lagrange multipliers, set ^X·w = ^y up as a constraint and
set the optimality? of that equal to zero.

>              min ∥w∥² + λ·αᵀ(^Xw - ^Y)

From this a new objective function:

>              ∥w∥² + αᵀ(^Xw - ^Y)

Working through this Lagrange stuff more (not done on the video 
or in the lecture notes), we get:

###### Solution of w for n < d

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

The thing that we just rediscovered is called the "pseudoinverse".

#### Pseudoinverse of the least squares problem

_Moore-Penrose Pseudoinverse_ 
[wikipedia](https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse)

>          ^w = (^X†)^Y
> 
>          ^X† = (^Xᵀ·^X)⁻¹·^Xᵀ    for n > d (independent columns)
> 
>          ^X† = ^Xᵀ(^X·^Xᵀ)⁻¹     for n < d (independent rows)

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
1. If you have a rectangular matrix, computationally what you
   do for the pseudoinverse, is check which (^Xᵀ·^X) is the
   smallest of the two, invert that matrix and solve the problem  
2. The computational cost of inverting the matrix to calculated
   the n > d case, is the size of the matrix cubed, plus some
   other stuff, so a total cost of d³ + nd² ,
   for the n > d case, it is n³ + d²n
3. Starting with ^w = ^Xᵀ·(^X·^Xᵀ)⁻¹·^Y for systens with n < d,
   what is the  size/dimension of the "(^X·^Xᵀ)⁻¹·^Y" part? It
   is an n-dimenstional vector, so we will give it a name: "C"

#### Representer theorem (C)

_Note that that starting point seems to imply that the C
mechanism only works for systems with n>d. TODO: check this!_

>          ^w = ^Xᵀ(^X·^Xᵀ)⁻¹·^Y
>             = ^Xᵀ·C
>             = ∑_i:1:n xᵢ·cᵢ   ∈ Range(^Xᵀ)

The "w" are linear combinations of the input power, we will 
call this the "representor theorem", and it is the way to build 
non-parametric models through kernels.
          
>          ^f†(x) = xᵀ·^w†
>                 = ∑_i:1:n xᵢᵀ·xᵢ·cᵢ 

Can view this as a linear combination or a kind of correlation 
between the new input and the input points, think of this 
inner product as some kind of similarity, not really because 
they're not normalized, but a kind of the angle related to the 
angle between my vectors. In other words, a weighted combination 
of the similarites where here the similarity is just the inner
product. These are going to become kernels in a little bit.

(Here a question from the audience which was similar to the
one I had. Why is the order here "xᵀ·^w†" different than the
order of the original defintion of "f=^X·w". Rosasco's
answer was "for (because of) the magic property of the inner 
productto be symmetric". He seems to imply that it is also 
visually easier on his brain. Someone else asked if it would
also work if we picked a different norm, and the answer was
"no".)

One last observation:

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
we're actually going to build quite a bit on this in all sorts of ways.

(explicit expression with abstract albegra in response to a question)
>          ℝᵈ = NullSpace(^X) ⊕ Range(^X)

#### Single Value Decomposition (SVD) of the matrix ^X

Introducing the SVD of the matrix ^X
[wikipedia](https://en.wikipedia.org/wiki/Singular_value_decomposition)

_Great series on SVD, and other things on
[youtube](https://www.youtube.com/watch?v=nbBvuuNVfco) 
but it raises the question: SVD always seems to be
described with the objects in X arranged into column
vectors, where as we have (I think) our objects
arranged into rows, with each new sample/data point
taking up a new row. I wonder how this ISN'T a 
problem for SVD..._

##### Matrix form
>          ^X = U·S·Vᵀ
>                      U : orthonormal basis in ℝⁿ
>                      S : diagonal that satifies the expression
>                      V : orthonormal basis

##### Action on a vector form
>          ^X·w = Σ_j:1:r s_j·(v_jᵀ·w)·u_j
>               r ≤ min(n,d)
> 
>           ( ^w† = ) ^X†^Y = Σ_j:1:r (1/s_j)·(u_jᵀ·^Y)·v_j

>   More points from lecture notes
>     (but NOT mentioned in the video:
>     * (v_j)_j are the principal components of ^X:
>         OLS "likes" principal components
>     * Not all linear functions are the same for OLS!
>     * The pseudoinverse introduces a bias towards
>         certain solutions

Can we use this for samples corrupted by noise?
Is this decomposition a good idea? If s_j, is big 
it could be fine, but if it is small, this is bad news.
From a statistical point of view, the implication seems
to be that the moment we move the (sample) data a little
bit, we get different solutions. If our goal is to 
generalize to new data, this doesn't sound like a good 
property.

(Here on the video, the are some doubts about what he 
actually did to get the SVD)

So how do we fix it? We have an algorithm, we can compute it,
is just the least squares. We can compute it if n > d, n < d, 
we can do whatever you want but it might be that if the data 
are such that the eigenvalues are small, it is not a good idea.
You have to fix it, how do you fix it? Well there are many 
ways of doing it. One way is to remember that X† can also be 
defined this way:

>          ^X† = lim_λ→0₊ (^Xᵀ·^X + λ·I)⁻¹·^Xᵀ
>          ^X† = lim_λ→0₊ ^Xᵀ·(^X·^Xᵀ + λ·I)⁻¹  (from L.N.)

What if instead of doing this, we fix a suitable λ ?

>              ≃ (^Xᵀ·^X + λ·I)⁻¹·^Xᵀ

This is now the THIRD definition of ^X† ...

According to Rosasco, its all in the first page of the 
[wikipedia for pseudo inverse](https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse)
and the second page of the 
[wikipedia for linear system](https://en.wikipedia.org/wiki/System_of_linear_equations) ,
its not advanced stuff. According to him.

_In the video some notation complaints similar to mine about 
the similarity of "ᵀ" and "†"_

We will fix this problem with ...

#### Regularization

Consider for λ > 0, 

>          ^w^λ = (^Xᵀ·^X + λ·I)⁻¹·^Xᵀ·^Y
>               = Σ_j:1:r (s_j)/(s_j² + λ)·(u_jᵀ·^Y)·v_j
>                                             (from SVD)
 
from the lecture notes: this is called "ridge regression"

The function
>          F(s) = (s_j)/(s_j² + λ)
acts as a low-pass filter (low frequencies=princpal components)
* For s small, F(s) = 1/λ
* For s big, F(s) = 1/s

_Sanity check from the SVD..._

If λ is very small it's another sanity check, so you know
it's one way to prove this: if λ is very small you're back 
to business. If λ is very big you're essentially killing 
all the eigenvalues. In a smooth way you don't just set them 
equal to zero but you're effectively killing them.

These is some tension about this being about an approximation,
we have to live with it, but we said we didn't want something 
that was going to blow up with small changes to the input space.

This algorithm we have found:

>          ^w^λ = Σ_j:1:r (s_j)/(s_j² + λ)·(u_jᵀ·^Y)·v_j

is called "Regularized Least Squares" 
(or maybe ridge regression).

_A lot of chat about the selection of λ and the theoretical
basis of some of these things. Choosing λ is one reason to
study statistical learning theory._

Summed up: You choose λ by cross-validation

#### Going back to ERM

Trying to get this:
>              min ∥w∥ of ^Xw - ^Y

We now know how to get this:
>              ^w† = ^X†·^Y

And this:
>          ^w^λ = (^Xᵀ·^X + λ·I)⁻¹·^Xᵀ·^Y

Is it empirical risk minimization or not?

Well, it IS this solution for this:

>               min   Σ_i:1:n (yᵢ - wᵀxᵢ)² + λ·∥w∥² 
>              w ∈ ℝᵈ

So yes... if we are looking for the best possible w, 
the one that minimizes the square loss: 

>               min   Σ_i:1:n (yᵢ - wᵀxᵢ)² + λ·∥w∥² 
>              w ∈ ℝᵈ

(or, same thing in matrix form):

>                             ^L_λ(w)
>                     — — — — —/\—— — — — —
>               min   ∥^Y - ^X·w∥² + λ·∥w∥² 
>              w ∈ ℝᵈ

The solution for it is:

>              ^w^λ = (^Xᵀ·^X + λ·I)⁻¹·^Xᵀ·^Y

_A concise derivation of ^L_λ from the lecture notes... 
(that includes "n", see below). It follows from:_ 

>          Δ^L_λ(w) = -(2/n)·^Xᵀ·(^Y - ^X·w) + 2·λ·w
>                   = 2·((1/n)·^Xᵀ·^X + λ·I)·w - (2/n)·(^Xᵀ·^Y)

Observations:

1. We lost the 1/n, the version with n would be:  

>               min  (1/n)· Σ_i:1:n (yᵢ - wᵀ)² + λ·∥w∥² 
>              w ∈ ℝᵈ    

_and the equivalent matrix version from the lecture 
notes:_ 

>                              ^L_λ(w)
>                     — — — — — —/\—— — — — — — —  
>               min   (1/n)·∥^Y - ^X·w∥² + λ·∥w∥² 
>              w ∈ ℝᵈ  

_ERM interpretation suggests the rescaling:_

>          ^w^λ = (^Xᵀ·^X + n·λ·I)⁻¹·^Xᵀ·^Y

##### Key equations

These equations are so **important** they get the 
LaTeX treatment:

```math
    \begin{multline}
      \begin{split}
        \min_{w \in \mathbb{R}} \frac{1}{n} (
          \sum_{i=1}^{n} (y_{i} - w^{T}x_{i})^2
          + \lambda \left\| w \right\|^2 ) \\ 
                                           \\
        \min_{w \in \mathbb{R}} \frac{1}{n} \left( 
          \left\| (\hat{Y} - \hat{X} w \right\|^2
          + \lambda \left\| w \right\|^2 \right) \\
                                                 \\
        \hat{w}^{\lambda} = 
          (\hat{X}^{T}\hat{X} + n\lambda I)^{-1} \hat{X}^{T}\hat{Y}
      \end{split}
    \end{multline}
```

>
> Questions and comments from the video 

_More comments from the audience... 1/s, butterfly
effect, etc. Concluding with:
The whole point of the discussion is the fact that 
we introduced a family of problems that somewhat 
trades off precision of approximation in multiple 
senses, robustness to sampling and noise._ 

_Another set of comments and responses about if this 
method is generally applicable to other loss functions
and other ways of calculating the norm. The answer, 
yes, its a good starting point._

Now a very important question from the audience 
(for me because I had the same doubt). Can you 
define this for all cases, n > d and so on. The 
answer: Yes, because we add theses λ so the 
expression always invertible.

We did two definitions of X†, one for n > d, 
one for n < d, here I just shoot this 
in your face. Ok now you can ask the question does 
this work in both cases? Yes because that was just in 
this case it's just different I give you the 
representation it's just this and you can see what 
he does on the eigenvalue, so it creates stability 
that's what we wanted to do so from their point of 
view is fine. 

Computationally, it is a different story, we will 
want to find another expression that is somewhat 
swapping the the order of the expression to make 
things more efficient, and and the same time derive 
more complicated estimators.

#### Summary from the lecture

_Basicially just a transcript..._

The tour today was starting from the empirical risk 
minimization approach to derive a learning algorithm,
specializing it to linear least squares, and then 
reminding you that you studied linear algebra.

So you multiply bunch of things here and there, you 
just recover a bunch of stuff and then it turns out 
that these tools that you studied can be useful the 
moment you have to ask other questions like 
robustness, because in some sense what you would 
call numerical stability now you can somewhat see as 
generalization, how much will generalize well to 
future data.

We did not prove anything but that's kind of 
intuition we are using here. Then from there we do 
least squares, then we do the penrose pseudoinverse 
and then from that we go on to introduce
this (the final equation for ^w^λ). It is called a 
bunch of things--it's called Tikhonov regularization,
penalized M estimation, ridge regression, penalized 
empirical risk minimization. We introduced it as
a way to stabilize stuff, but here you see why this
name might make sense the moment you go back to this 
(the original least squares minimalized least square
optimization with the λ norm add-on), because you can 
view this as a way to penalize the search for an 
empirical solution by basically saying I don't all 
solutions the same, I like some solutions better, the 
ones with a small norm.

You see that the pseudosolution also does tha,t because 
essentially among all the possible solutions, if you 
have many, it is looking for the one that are simple 
in the sense that it has as a small norm.

If you look into the literature you find the word 
"regularization" both for [ min ∥w∥ such that ^X·w + ^Y ] 
and [ min  (1/n)· Σ_i:1:n (yᵢ - wᵀ)² + λ·∥w∥²  ], so if 
you want this is a selection procedure among many 
possible solutions. You select one.

If you look at signal processing, for example, often 
times this is called regularization, and these days 
it is fashionable to call this an implicit bias or 
a bias in my procedure. If I have many solutions I
want to go to a precise one--in some precise sense, 
that can be seen as a bias.

In more standard theory of regularization, you call 
this the "seed of solution" and you reserve the word 
"regularization" for fixing the instability problems 
( the one with saw with SVD). The (1/s) can be 
unstable, so if it is fix it. This is the more 
classical way to use the term regularization. 

If you look at today's paper, for example, of neural 
networks both notions are often used, this is called 
an implicit bias and implicit regularization, but this 
is also called regularization. This is a distinction 
that you're gonna see appearing in a few places... 

From now on what we want to do is instead of linear 
models, take non-linear models. Instead of the least 
square, take the lambda loss function. Instead of the 
square norm, take another norm. Instead of this 
empirical stuff, use another way to search for 
solutions, like optimization.

That's kind of you know a spoiler (of what's to come.)

_Question about probabity theory and gaussian noise_

Interesting answer: you can use this for classification, 
and it works just fine. If you have enough data it 
works fine.

_More talking about what will happen in the future: 
kernels, neural nets, logistic, hinge loss, 
projection, implicit regularization._



