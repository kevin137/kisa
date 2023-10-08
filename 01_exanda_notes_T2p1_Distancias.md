# T2.1 Distancias

## Introduction

We examine Ω = {1, 2, …, n}, a collection of n objects.

>                   Objects
>                 ↙         ↘
>          Matrix   ———————⇀  Matrix of  
>          of data             distances
>                 ↘         ↙
>                   Methods

## Distance

### Definition distance/dissimilarity (distancia/disimilaridad)

A distance or dissimilarity over a collection Ω is a function _d_:

>          d : Ω × Ω  ⟶ R
>              (i,j)  ⟼ d(i,j) = d_ij

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
>                d_n1  d_n2   …     0

**We call this the "Distance Matrix" over Ω**

## Similarity

### Definition of similarity (similaridad)

A similarity over a collection Ω is a function _s_:

>          s : Ω × Ω  ⟶ R
>              (i,j)  ⟼ s(i,j) = s_ij

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

### Types of distances and similarities

Over every object Ω, _p_ variables have been measured

>          XoXoX xi = (xi1, ..., xip) 0 ∈ R   p, i = 1,…,n

