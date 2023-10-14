## Notes from 9.520/6.860: Statistical Learning Theory and Applications - Class 4
> Prof. Lorenzo Rosasco, University of Genoa / MIT

[video](https://www.youtube.com/live/_hOZw7SsTXc?si=zzCKphDZ1BmXHv1-)

[lecture notes](https://github.com/sebastiani/6.860-Statistical-Learning-Theory/blob/master/lectures/lecture4_features_and_kernels/Class04_Feature%2BKernels.pdf) (from a slightly later class)

_Goal of today, going beyond linear models. Non-parametric models, feature mapping kernels_

### Finishing up something from the last class

ERM (Empirical Risk Minimization) for least squares

>               min   (1/n)·∥^X·w - ^Y∥² 
>              w ∈ ℝᵈ  

From this we can just jump into the linear algebra, 
one way for n > d, another for n < d, but we see that 
it is a strongly convex solution. 

If there are n < d and there are multiple solutions, 
we might have to select **one**:

>              ^w† = argmin  ∥w∥²
>                    w ∈ O  
>
>               O =  argmin (1/n)·∥^X·w - ^Y∥² 
>                    w ∈ ℝᵈ  

_My note, of the solutions O from the second formula, 
we go on to pick the one with the smallest norm_

So we can select and calculate one solution.

From multivariate calculus, we know the solution can 
always be written this way from a matrix point of view:

>              ^w† = ^X†·^Y

_Recap: the dagger † means pseudoinverse, not quite the
inverse, the pseudoinverse_

>                     ^w† = ^X†·^Y
>                             / \ 
>             (^Xᵀ·^X)⁻¹·^X·^Y   ^Xᵀ·(^X·^Xᵀ)⁻¹·^Y
>                   n > d            n < d
>              {dxd matrix}       {nxn matrix}

_notation shift: as requested from YouTube comments, we 
will now use use star * instead of ᵀ for transpose. So 
the expression above becomes:_

>                    ^w† = ^X†·^Y
>                            / \ 
>            (^X*·^X)⁻¹·^X·^Y   ^X*·(^X·^X*)⁻¹·^Y
>                  n > d            n < d
>              {dxd matrix}      {nxn matrix}

_star * seems to be the more general way to show 
transpose anyway_

And then the discussion continued: let's write these 
on the basis that I'm going to diagonalize the matrix 
with SVD, and that we are dividing by, potentially 
small singular values, and this could be a source of 
instability, if your Xs and Ys change. And they could, 
because they are just a training set. Intuitively, 
this could be a sign of bad generalization. New 
datapoints could give wildly different solutions. This 
is probably not what we want.

Notice that is conditioned to the fact that there is a 
small enough singular value to create this effect. If 
there matrices have a good condition, a good number 
ratio between larger and smallest singular value, its 
fine, but let's assume that you _DO_ have small 
eigenvalues, then what we did is introduce the 
"regularized solution":

>          ^w^λ = (^X*·^X + n·λ·I)⁻¹·^X*·^Y

You can get to this many different ways, but the way 
we did it was to remember that in the limit of λ going 
to zero, you get back the un-regularized equation for 
w. However, because you have the λ popping something 
in on the diagonal, if there is a small singular value, 
its importance is going to be decreased because of the 
λ. You are going to make the matrix invertible. 

On the one end, you lose if S is not a good approximation, 
but for larger λ you get better stability properties.
Now you have to decide how to choose λ. The short answer 
is cross-validation (the long answer we don't discuess).

The main point is that we introduced a new knob. This is 
what is called the regularization parameter, and from 
this point of view there seems to be a connection 
between the numerical stability, and the statistics and 
generalization properties of learning. 

From there, if we go back to an optimization formulation, 
and consider a penalized problem, unconstrained

>       ^w^λ = argmin (1/n)·∥^X·w - ^Y∥² + λ·∥w∥²
>              w ∈ ℝᵈ  

It's exactly least squares plus the norm and λ, and if 
you just take the gradient of this and set it equal, you 
get back to this:

>          ^w^λ = (^X*·^X + n·λ·I)⁻¹·^X*·^Y

... the ^w^λ is the minimizer of the penalized problem.

This a convex continuous function, and it is _strongly_ 
convex because of λ∥w∥² so this is actually the unique 
solution of the problem. The two equations are completely 
equivalent, but now you can take two different points of 
view. You can view (the penalized formulation) as a 
constrained or penalized ERM where you say, I don't just 
look for a solution, I actually want a solution 
with a small norm. Remember the norm is just the sum 
of the square weight:

>              ∥w∥ = ∑i:1:n (w*)²

so you can imagine it intuitively as a "budget" on the 
importance of each relative dimension. If you make
(the norm portion) very small, in some sense the intuitive 
idea is that you're going to try to shrink some of the 
coefficients towards zero. You don't make think them zero, 
you just somewhat try to shrink them. 

This is also called "shrinkage" in statistics sometimes, 
push this vector to zero. But you have a tension between 
pushing it to zero and fitting the data and, again the 
reason we start from least squares is because we like the 
fact that we can immediately start to see things from 
different perspectives and see how they are intimately 
related. 

The more classical empirical point of view is:

>       ^w^λ = argmin (1/n)·∥^X·w - ^Y∥² + λ·∥w∥²
>              w ∈ ℝᵈ  

And the linear algebra perspective is:

>          ^w^λ = (^X*·^X + n·λ·I)⁻¹·^X*·^Y

this one is good because numerical stability and 
statistics "talk to each other". Later on we'll see that 
the (linear algebra persepective) is one possible way to 
extend the concept.

A few comments:

1. In all cases you take the limit of λ⟶0, and and you
   go to the right place. The objective function reduces
   to:

   >              ^w† = argmin  ∥w∥²
   >                    w ∈ ℝᵈ 

2. For both situations (n>d, n<d) there is something here.

   If you are in the case **n > d**, there is only one
   solution, so you know the limit of
   
   >       ^w^λ = argmin (1/n)·∥^X·w - ^Y∥² + λ·∥w∥²
   >              w ∈ ℝᵈ   

   reduces to

   >              argmin (1/n)·∥^X·w - ^Y∥² 
   >              w ∈ ℝᵈ  

   If you are in the case **n < d**, there are multiple
   solutions and it doesn't make sense to look at the limit.
   You can look at the functions, and they will still converge
   for λ⟶0, so again:

  >       ^w^λ = argmin (1/n)·∥^X·w - ^Y∥² + λ·∥w∥²
  >              w ∈ ℝᵈ  

   reduces to

   >              argmin (1/n)·∥^X·w - ^Y∥² 
   >              w ∈ ℝᵈ  

   but if you want to talk about minimizers, where ^w^λ
   has to go, you have to be careful in the n < d
   (over-parameterized) regime. You have to select the
   minimum norm one:
   
   >              ^w† = argmin  ∥w∥²
   >                    w ∈ ℝᵈ  

   3. The "penalized" or "Lagrangian" formulation

   >       ^w^λ = argmin (1/n)·∥^X·w - ^Y∥² + λ·∥w∥²
   >              w ∈ ℝᵈ    

   is by no means the only one you can consider, another 
   is the constrained or Ivanov formulation:

   >         min   (1/n)·∥^X·w - ^Y∥²  s.t. ∥w∥² ≤ R
   >        w ∈ ℝᵈ

   You've constrained your solution to lie in a ball of
   radius R. It can be proven that these two problems are
   equivalent, meaning that there are choices of R and λ 
   that makes the formulations equivalent.

   There is yet another formulation where you try to 
   minimize the norm subject to a bound on ∥^X·w - ^Y∥²,
   you say the error has to be smaller than some delta. 
   This is the Morozov formulation, and yet again it is
   another equivalent formulation.

   These alternatives are not going to play a role this 
   course, but they come up in the literature. The one 
   we are using (Tikhonov) is usually the computationally 
   simplest one.

   4.  ---- about at 16:00  ....
