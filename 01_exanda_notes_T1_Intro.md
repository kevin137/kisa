# T1 Introducción

*Skipping some of the introductory material for now*

## Definition of data

### Collection of objects (cases, individuals)

>          Ω = {ω1,..., ωn}

or, simplifying: Ω = {1,..., n}

### Descriptors of objects (variables, characteristics)

>          X1,..., Xp

### Representation of the space Xj → Mj , j = 1,..., p

### Description of the objects (object-attibute-value)

>          Xj :   Ω → Mj
>               ω_i → x_ij     

*Meta-note: In these notes I will take a flexible approach with 
subscripts and superscripts; Markdown is clumsy for any kind of 
mathematical notation, and speed and efficiency are more 
important right now than beauty or perfection. In the case of 
the above definition: Ω → Mj means Ω → M<sub>j</sub> and
ω_i → x_ij means ω<sub>i</sub> → x<sub>ij</sub>*


### Typical example highlighting the nomenclature

We consider the following data concerning data relative to 
**p = 6** variables measured over a group of **n = 10** newborns.

    X1: altura (cm)
    X2: peso (kg)
    X3: sexo (0: niña, 1: niño, 2: no binario)
    X4: tiempo gestación (1: más de 35 semanas, 0: menos de 35 semanas)
    X5: grupo sanguíneo (1: 0, 2: A, 3: B, 4: AB)
    X6: raza (1: blanca, 2: negra, 3: otros)

>          Individuo  X1    X2   X3  X4  X5  X6
>             ω1      52.5  3.8  1   1   1   1
>             ω2      50.2  2.9  0   1   1   1
>             ω3      53.4  4.2  0   1   3   2
>             ω4      49.8  2.8  0   0   1   1
>             ω5      53.4  3.9  1   1   2   2
>             ω6      54.1  4.6  0   1   1   1
>             ω7      52.3  3.7  1   1   1   2
>             ω8      53.8  3.9  0   1   4   1
>             ω9      50.7  2.6  1   0   2   1
>            ω10      51.6  3.5  1   1   1   3

*Important to remember: p variables (measurements) arranged into columns
over n objects (cases, individuals) which form the rows*

#### Additional commentary

This typical representation is not universal, there can be
information relating the objects to each other:

* Objects ordered in time → time series (series temporales)
* Objects ordered in space → spatial data (datos espaciales)
* Groups of related objects → mixed models (modelos mixtos)


## Data Analysis Tecniques from 10000ft

It is difficult to make an exhaustive classificaion, 
but the two main types are:

### Unsupervised tecniques (Técnicas no supervisadas)
* Dimension(ality) reduction (reducción dimensión): PCA (ACP), MDS, ...
* Clustering: k-means, hierarchical, mixtures, ...

### Supervised tecniques (Técnicas supervisadas)
* Classification: linear discriminant, k-NN, classification trees, ...
  neural networks, SVM (support vector machine), logistic reg. ...
* Regression: linear, non-parametric, GAM, Ridge,
  neural networks, SVM, ...


## Mapping data into matrices

We have **n** individuals for whom **p** variables have been measured

Matrix of data (n x p): 𝐗

>               x11  x12  ...  x1j  ...  x1p
>               x21  x22  ...  x2j  ...  x2p
>                ⋮
>          𝐗 =  xi1  xi2  ...  xij  ...  xip
>                ⋮
>                ⋮
>               xn1  xn2  ...  xnj  ...  xnp

Rows of 𝐗 → individuals

>          𝐱i = (xi1 xi2 ... xip)'


Columns of 𝐗 → variables

>               xij
>               x2j
>          Xj =  ⋮
>                ⋮
>               xnj

### In summary

* We have p > 1 measurements or readings over each individual
* We are interested in studying all the variables jointly (as a group)
* Objectives:
  * Summarize and synthesize
  * Facilitate understanding of the pheomenon being studied


## Types of data

### Qualitative : the variables represent qualities
1. Binary: only two possible values (true/false), (present/absent)
2. Nominal: more than two possible values

### Quantitative: the values of the variable have numeric meaning
1. Discrete: the range of the variable is finite or numerable
2. Continuous: the range of the variable contains an interval in reals (ℝ)
     X1 →  ? ...


## Review of Statistics

### Definition
Statistic: "number" that encapsulates a certain characteristic of the data

### General types

#### Central tendency: 
* Mean (media) AKA average
* Median (mediana)
* Mode (moda) 

#### Dispersion: 
* Variance (varianza) 
* Standard deviation (desviación estándar)
* Interquartile range (rango intercuartil)

*What sense does it make to talk about the "average" blood type?*


### Quantitative variables - Mean (media)

Data: 𝐗, all quantative

>    xbar_j = (1/2)*Sum[x_ij,{i,1,n}] for j={1,2,...p}   
```math
\bar{x}_{j} = \frac{1}{n}\sum_{i=1}^{n}x_{ij} \hspace{12pt} j = 1,...,p
```

Vector of means:
```math
\bar{\textbf{x}} = \begin{pmatrix} \bar{x}_{1}
 \\                                \bar{x}_{2}
 \\                                \vdots
 \\                                \bar{x}_{j}
\end{pmatrix}
```

As a matrix:
TODO......FILL THIS IN

### Quantitative variables - Variance (varianza)

Data: 𝐗, all quantative

#### Variance

>    s_j_squ = (1/(n-1))*Sum[(x_ij-xbar_j)^2, {i,1,n}] for j={1,2,...p}
```math
s_{j}^2 = \frac{1}{n-1}\sum_{i=1}^{n}(x_{ij}-\bar{x}_{j})^2 \hspace{12pt} j = 1,...,p
```


#### Standard deviation (desviación estándar)

>    s_j = Sqrt[s_j_squ] for j={1,2,...p}
```math
s_{j} = \sqrt{s_{j}^2} \hspace{12pt} j = 1,...,p
```





# T2.1 Distancias

# T2.2 Clustering

# T3.1 Reducción dimensionado

# T3.2 Otros paradigmas

# T4 Modelos de Regresión

