# T1 Introducción

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
the above definition:*

Ω → Mj means Ω → M<sub>j</sub>

*and*

ω_i → x_ij means ω<sub>i</sub> → x<sub>ij</sub>


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

# T2.1 Distancias

# T2.2 Clustering

# T3.1 Reducción dimensionado

# T3.2 Otros paradigmas

# T4 Modelos de Regresión

