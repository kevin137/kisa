# T2.2 Clustering

Unsupervised classification, clustering

### Introduction

Let Ω = {1,2, …, _n_} be a set of _n_ objects over which 
different variables have been measured.

#### Principal objective

* Find the various possible groups or clusters that make
  up these clusters
* The objects grouped into the same cluster should be
  similar among themselves and different to the objects
  grouped into the other clusters.
* The clusters are created without previous information
  and are suggested by the "essence" of the data themselves.

#### Applications

* Microarray data: group and identify genes that act in
  similar or different way in biological processes
* Segmentation of images: identify the diferent elements
  present in an image.
* etc...

#### What is a cluster?

In some cases, it's not easy to determine.

#### Groups of techniques

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



2023-09-19 EXANDA lecture stars on slide "Métodos particionales"

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
