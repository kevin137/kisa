# T2.1 Distancias

## Introduction

We examine Ω = {1, 2, …, n}, a collection of n objects.

>                   Objects
>                 ↙         ↘
>          Matrix   ———————⇀  Matrix of  
>          of data            distances
>                 ↘         ↙
>                   Methods

## Distance

### Definition distance/dissimilarity (distancia/disimilaridad)

A distance or dissimilarity over a collection Ω is a function _d_:

>          d : Ω × Ω  ⟶ ℝ
>              (i,j)  ↦ d(i,j) = d_ij

that exhibits the following properties:
  1. d(i,j) ≥ 0  ∀i, j ∈ Ω 
       > distances are always positive or zero
  2. d(i,i) = 0  ∀i ∈ Ω 
       > distance from one object to itself is always zero
  3. d(i,j) = d(j,i)  ∀i, j ∈ Ω 
       > the distance from object A to object B is the same as
       > the distance from  object B to object A 

#### Metric space (métrica)

If it additionally obeys:
>          d(i,j) ≤ d(i,k) + d(j,k) ∀i, j, k ∈ Ω,
the distance or dissimilarity is said to be a "metric space" (métrica)

### Distance matrix

With the number of objects Ω = n, we arrange a symmetric matrix _n_ x _n_,

>                 0    d_12   …   d_1n 
>                d_21    0    …   d_2n 
>          D =    ⋮                 ⋮
>                 ⋮                 ⋮
>                d_n1  d_n2   …    0

**We call this the "Distance Matrix" over Ω**

## Similarity

### Definition of similarity (similaridad)

A similarity over a collection Ω is a function _s_:

>          s : Ω × Ω  ⟶ ℝ
>              (i,j)  ↦ s(i,j) = s_ij

such that:
  1. 0 ≤ s(i,j) ≤ 1  ∀i,j ∈ Ω 
       > similarities are always between zero and one
  2. 1 = s(i,i) ≥ s(i,j)  ∀i,i ∈ Ω 
       > the similarity between and object and itself is always greater
       > than or equal to the similarity of two non-identical objects
  3. s(i,j) = s(j,i)  ∀i,j ∈ Ω 
       > the similarity of object A to object B is the same as
       > the similarity of object B to object A 

### Similarity matrix

With the number of objects Ω = n, we arrange a symmetric matrix _n_ x _n_,

>                 1    s_12   …   s_1n 
>                s_21    1    …   s_2n 
>          S =    ⋮                 ⋮
>                 ⋮                 ⋮
>                s_n1  s_n2   …     1

## Distance ⟷ similarity

If _i_ and _j_ are two objects,

* d_ij = 1 − s_ij
* d_ij = √(1 − s_ij)

Of these two transformations, the second may be preferable.

## Types of distances and similarities

Over every object Ω, _p_ variables have been measured

>          𝐱_i = (x_i1, …, x_ip)' ∈ ℝ^p,   i = 1,…,n

* Depending on the nature of the variables under consideration,
  (continuous, binary, or mixed), different types of distances
  or similarities should be used.
* The use of one particular type of distance (similarity) or
  another depends on the nature of the data, that is, if their
  origin is a genetic, ecological, industrial study. etc...

An enormous variety of functions for distances and similarities 
are available.

### Distances for quantative variables

#### Eucliedan distance (quantative variables)

With 𝐱 = (x_1, …, x_p)′ and  𝐲 = (y_1, …, y_p)′ being the 
representations of two objects in Ω

* The _"Euclidean distance"_ between the two objects is defined as

  ```wolfram
  d_E = (Transpose[x-y] . (x-y) )^(1/2)
  d_E = (Sum[(x[[i]]-y[[i]])^2, {i,1,p}])^(1/2)
  ```
  ```math
    \begin{multline}
      \begin{split}
        d_{E}(\textbf{x},\textbf{y}) &= 
          \left[(\textbf{x}-\textbf{y})'
            (\textbf{x}-\textbf{y})\right]^{\frac{1}{2}} \\
                                     &= 
          \left[\sum_{i=1}^{p}(x_{i}-y_{i})^{2}\right]^{\frac{1}{2}}
      \end{split}
    \end{multline}
  ```

#### Minkowsky distance (quantative variables)

With 𝐱 = (x_1, …, x_p)′ and  𝐲 = (y_1, …, y_p)′ being the 
representations of two objects in Ω

* The _"Minkowsky distance"_ _(q ≥ 1)_ between the two objects
  is defined as

  ```wolfram
  d_M = (Sum[ (Abs[ x[[i]]-y[[i]] ])^q, {i,1,p}])^(1/q)
  ```
  ```math
    \begin{multline}
      \begin{split}
        d_{M}(\textbf{x},\textbf{y}) = 
          \left(\sum_{i=1}^{p}|x_{i}-y_{i}|^{q}\right)^{\frac{1}{q}}
      \end{split}
    \end{multline}
  ```
    - When _q_ = 2, this reduces to the euclidean distance
    - When _q_ = 1, the distance known as the Manhattan distance,
                    Manhattan metric, city distance, taxicab geometry, etc.
                    
#### Pearson distance (quantative variables)
 
_Developed by Karl Pearson_

With 𝐱 = (x_1, …, x_p)′ and  𝐲 = (y_1, …, y_p)′ being the 
representations of two objects in Ω ,

and with (s_1², …, s_p²) being the variances of the variables
X_1, …, X_p, respectively ,

* The _"(K.) Pearson distance"_ between the two objects
  is defined as
  
  ```wolfram
  d_P = (Transpose[x-y] . Inverse[DiagonalMatrix[{s1,s2,…,sn}]] . (x-y) )^(1/2)
  d_P = (Sum[(1/(s[[i]])^2)*( x[[i]]-y[[i]] )^2, {i,1,p}])^(1/2)
  ```
  ```math
    \begin{multline}
      \begin{split}
        d_{P}(\textbf{x},\textbf{y})
          &= 
          \left[(\textbf{x}-\textbf{y})'
            \textbf{S}_0^{-1}
            (\textbf{x}-\textbf{y})
          \right]^{\frac{1}{2}} \\
          &= 
          \left[\sum_{i=1}^{p}
            \frac{(x_{i}-y_{i})^{2}}
                 {s_i^{2}}
          \right]^{\frac{1}{2}}
      \end{split}
    \end{multline}
  ```
  where 𝐒_0 = _diag[s_1², …, s_p²}_.
  
When s_i² = 1 (i = 1, …, p)  this reduces to the euclidean distance

#### Mahalanobis distance (quantative variables)

With 𝐱 = (x_1, …, x_p)′ and  𝐲 = (y_1, …, y_p)′ being the 
representations of two objects in Ω ,

and 𝐒 being the variance-covariance matrix of the variables
X_1, …, X_p ,

* The _"Mahalanobis distance"_ between the two objects
  is defined as
  
  ```wolfram
  d_MH = (Transpose[x-y] . Inverse[S] . (x-y) )^(1/2)
  ```
  ```math
    \begin{multline}
      \begin{split}
        d_{MH}(\textbf{x},\textbf{y})
          &= 
          \left[(\textbf{x}-\textbf{y})'
            \textbf{S}^{-1}
            (\textbf{x}-\textbf{y})
          \right]^{\frac{1}{2}}
      \end{split}
    \end{multline}
  ```

When the variables X_1, …, X_p are uncorrelated 
(s_ij² = 0  ∀i,j) this reduces to the Pearson distance

### Similarities for qualitative (binary) variables

With binary variables X₁ …, Xₚ with with values in {0,1},

and with 𝐱 = (x₁, …, xₚ)′ and  𝐲 = (y₁, …, yₚ)′ being the 
representations of two objects _i_ and _j_ in Ω, respectively,

>                        Object 1
>                         1    0
>                       __________
>                    1 |  a    b  | a+b
>          Object j    |          |
>                    0 |  c    d  | c+d
>                       __________
>                        a+c  b+d    p

In such a way that:
* the two cases had value 1 simultaneously in _a_ variables,
* the two cases had value 0 simultaneously in _d_ variables,
* case _i_ had value 0 while case _j_ had value 1 in _b_ variables,
* case _i_ had value 1 while case _j_ had value 0 in _c_ variables.

We define:

𝐱ᶜ = (1 - x₁, …, 1 - xₚ)′ and  𝐲ᶜ = (1 - y₁, …, 1 - yₚ)'

And then,

>          a = 𝐱'𝐲
>          b = 𝐱ᶜ'𝐲ᶜ
>          c = 𝐱ᶜ'𝐲
>          d = 𝐱'𝐲ᶜ

Assuming _X_ is the matrix of binary data,
What does the product _X_·_X'_ calculate? 

#### Sokal-Michener similarity (binary variables)

With 𝐱 = (x₁, …, xₚ)′ and  𝐲 = (y₁, …, yₚ)′ being the representations
of two objects in Ω,

* the _Sokal-Michener similarity_ between the two objects is defined as

  ```wolfram
  s_SM[[i,j]] = (a + d)/p
  ```
  ```math
    \begin{multline}
      \begin{split}
        s_{SM}(i,j) &= \frac{a+d}{p}
      \end{split}
    \end{multline}
  ```
This similarity coefficient must be translated into distance.
1. _d_ij_ = 1 - _s_SM(i,j)_
2. _d_ij_ = √(1 - _s_SM(i,j)_)
   
#### Jaccard similarity (binary variables)

With 𝐱 = (x₁, …, xₚ)′ and  𝐲 = (y₁, …, yₚ)′ being the representations
of two objects in Ω,

* the _Jaccard similarity_ between the two objects is defined as

  ```wolfram
  s_J[[i,j]] = a/(a + b + c)
  ```
  ```math
    \begin{multline}
      \begin{split}
        s_{SM}(i,j) &= \frac{a}{a + b + c}
      \end{split}
    \end{multline}
  ```
This similarity coefficient must be translated into distance.
1. _d_ij_ = 1 - _s_SM(i,j)_
2. _d_ij_ = √(1 - _s_SM(i,j)_)

Example: TODO

#### Gower similarity (mixed variables)

Variables X₁ …, Xₚ are said to be mixed if among them are 
quantitative and qualitative (binary and nominal) variables.

Suppose that we have p₁ quantitative, p₂ binary, 
and p₃ qualitative (nominal) variables,

* The _Gower similarity_ between two objects is defined as

  ```wolfram
  s_J[[i,j]] = a/(a + b + c)
  ```
  ```math
    \begin{multline}
      \begin{split}
        s_(i,j) &= 
          \frac{\sum_{1}^{p_{1}}(1 - \lvert x_{l} - y_{l} \rvert/R_{l}) + a + \alpha}
            {p_{1} + (p_{2}-d) + p_{3}}
      \end{split}
    \end{multline}
  ```
This similarity coefficient must be translated into distance.
1. _d_ij_ = 1 - _s_SM(i,j)_
2. _d_ij_ = √(1 - _s_SM(i,j)_)


