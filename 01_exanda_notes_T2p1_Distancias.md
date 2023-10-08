# T2.1 Distancias

## Introduction

We examine Ω = {1, 2, ..., n}, a collection of n objects.

>                   Objects
>                 ↙         ↘
>          Matrix   ———————⇀  Matrix of  
>          of data             distances
>                 ↘         ↙
>                   Methods

## Definition distance/dissimilarity (distancia/disimilaridad)

A distance or dissimilarity over a collection Ω is a function _d_:

>          d : Ω × Ω  ⟶ R
>              (i,j)  ⟼ d(i,j) = d_ij

that exhibits the following properties:
  1. d(i,j) ≥ 0 ∀i, j ∈ Ω
  2. d(i,i) = 0 ∀i ∈ Ω
  3. d(i,j) = d(j, i) ∀i, j ∈ Ω

### Metric space (métrica)

If, additionally it obeys:
>         xxxxxx d : Ω × Ω  ⟶ R
