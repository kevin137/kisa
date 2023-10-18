# T2.2 Clustering

Unsupervised classification, clustering

## Introduction

Let Ω = {1,2, …, _n_} be a set of _n_ objects over which 
different variables have been measured.

## Principal objective

* **Find the various possible groups or clusters that make
  up these clusters**
* The objects grouped into the same cluster should be
  similar among themselves and different to the objects
  grouped into the other clusters.
* The clusters are created without previous information
  and are suggested by the "essence" of the data themselves.

## Applications

* Microarray data: group and identify genes that act in
  similar or different way in biological processes
* Segmentation of images: identify the diferent elements
  present in an image.
* etc...

## What is a cluster?

In some cases, it's not easy to determine.

### Overall division of techniques

En general, clustering techiques are divided into two 
large groups:

* Hierarchical methods

  Belonging to a cluster at a given level of hierarchy
  determines the membership to clusters at a higher
  level

  - Agglomerative
  - Divisive

  Built starting with a distance matrix

* Partitional methods

  Provide a unique partitioning, one the number of
  clusters _k_ has been set.

  Built starting with a matrix of data

* Other techniques: Models based on densities,
  clustering, ...

## Hierarchical methods

### What is a hierarchy?

> Hierarchical methods construct indexed hierarchies.

Suppose that we have _n_ = 5 objects collected in 
Ω = {1,2,3,4,5}. The following sequence of partitiones 
establish a hierachy:

>          P₀ = {{1}, {2}, {3}, {4}, {5}}
>          P₁ = {{1}, {2}, {3}, {4, 5}}
>          P₂ = {{1}, {2, 3}, {4, 5}}
>          P₃ = {{1, 2, 3}, {4, 5}}
>          P₄ = {{1, 2, 3, 4, 5}} = {Ω}

### Agglomerative vs. devisive

Depending on the order we move through the partitions 
defined before:

* P0 → P4: Agglomerative
  In each step the new clusters are created by uniting
  clusters from the previous step
  - Fast

* P4 → P0: Divisive
  In each step the new clusters are created by dividing
  clusters from the previous step 
  - Based on the global information Parten de la informaci´on global de los datos.
  - Slow

### Dendrogram

Hierarchical classifications con be represented on a 
bidirectional diagram called a **dendrogram**

![Dendrogram](https://upload.wikimedia.org/wikipedia/commons/c/ce/Dendrogram2.png)
<!--- Jakub al13, CC BY-SA 4.0 <https://creativecommons.org/licenses/by-sa/4.0>, 
        via Wikimedia Commons -->

### Indexed hierarchy

An indexed hierarchy (𝐂, α) over a collection of objects Ω 
forms a collection of clusters 𝐂 ⊂ P(Ω) and an index
α : 𝐂 → ℝ⁺ such that 𝐂 complies with the following axioms:

  1. Intersection axiom: if C,C′ ∈ 𝐂, then 
     C ∩ C′ ∈ {C, C′, ∅},
  2. Union axiom: if C ∈ 𝐂, then 
     C = ⋃{C′ | C′ ∈ 𝐂 and C′ ⊂ C},
  3. The union of all the clusters contain all the cases:
     Ω = ⋃{C | C ∈ 𝐂};
     
And the index α obeys:
* α(i) = 0, ∀i ∈ Ω,
* α(C) ≤ α(C′) if C ⊂ C′.

### Where are the clusters?

What are the partitions that a dendrogram or indexed hierarchy 
provides us?

⟶ To see them, you must **cut the dendrogram**

### Ultrametric space

We say that (Ω,u) is an ultrametric space if _u_ is a 
distance funcion defined over ΩxΩ and additionally 
obeys the _ultrametric property_. Which is:

>          u : Ω × Ω ↦ ℝ
>              (i,j) ↦ u(i,j) = uᵢⱼ

Such that:
1. u(i,j) ≥ 0 ∀i, j ∈ Ω
2. u(i,i) = 0 ∀i ∈ Ω
3. u(i,j) = u(j,i) ∀i, j ∈ Ω
4. Ultrametric property
   u(i,j) ≤ supₖ{u(i,k),u(j,k)}, ∀i, j ∈ Ω

#### All triangles are isosceles?

Property
> In an ultrametric space, all triangles are isosceles.

#### Ultrametric triangle:
An isosceles triangle with the base is the smallest side.

Example:

>              0   0.2  0.2   0.35  0.35
>                   0   0.15  0.35  0.35
>          U =           0    0.35  0.35
>                              0    0.1
>                                    0






2023-09-19 EXANDA lecture starts on slide "Métodos particionales"

next slide "Datos iniciales - ejemplo"

C1 = { 3,4,5 }, C2 = { 1,3 }

Why is this partition worse?

> The centroid of everything is too close to the centroid of one of the clusters and, and other problems

### Conceptos basicos

T, W, B 

Total variability = variability within clusters +  variability between clusters

#### Criterios

Idea intuitiva:
* Find partitions with small W
* Find partitions with large B

1. Minimize the trace of W
2. Minimize the determinant of W
3. Minimize the ¿coefficient? det(W)/det(B)
4. Minimize the trace of (W^-1)B

Remember ---> Trace of a matrix tr(W) is just the sum of the diagonals, w1,1+w2,2+w3,3+...wn,n

skipping some slide to "Algoritmos iteratives de recolocación"

1,3 semillas

C1={1,2}, C2={3,4,5}

Did we improve the situation?

### K-means

now K-medias (slide)

New slide with R code and my scribblings "Ejemplo - Resultados de R"

try various differnt nstart

Table 1

Table 2 

etc, fill in later

#### A tener in cuenta

* only indicated for cuantative variables Euclidean distances only
*  results depend on seeds, try different seeds
*  No stability in the partitions obtained
  - The number of fixed clusters k is not adequate
  - The is no structure to the cluster

### PAM (Partitioning Around Medoids)

PAM is very commonly used: No need for original data, with the distances you have enough

#### A tener en cuenta

* Applicable to a distance matrix
* Robust against outliers
* Puede ser no adecuado para conjuntos de datos muy grandes (-->CLARA)

Slide of R code

PAM is in library(cluster)

New slide ¿Cuantos cluster hay?

diagram sketch with 3 clusters

### Silhouettes

a few more slides, now 

* s(i) nos da la 'calidad' de la clasificación de i.
* Anchura media de silhouette "calidad" para un cluster C --> individual cluster
* Anchura media global de silhouette "calidad" de los datos ---> the whole organization of clusters

next slide "Ejemplo - Ruspini data"  ---> famous data

many more slides.... now "Aproximaciones para la validación"

Ill-posed-problem... but it can have a valid interpretation

1. INternal validation: coheision, stability
   * Sometimes Silhouette can be considered here
   * Dunn index
   * Tecnicas Monte Carlo para testear H0: 'No hay structura'
2. External validation:
   Hay una partition P={P1,...Ps} of external reference
   * Rand and Hubert indices

Interesting lecture: Henning, C. (2015) what are true clusterss= Pattern Recognition Letters, 64: 53.62
