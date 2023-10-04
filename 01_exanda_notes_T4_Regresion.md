# T4 Modelos de Regresión

2023-09-27 EXANDA

## Simple Linear Regression

Clasifica...
Ej 1: numericas
Ej 2: binarias

Factor de confusión -> "Confounding Factor/Variable"

### Paradoja Simpson / Simpsons paradox
>    Simpson's paradox is a phenomenon in probability and statistics in which a
>    trend appears in several groups of data but disappears or reverses when
>    the groups are combined. This result is often encountered in social-science
>    and medical-science statistics,[1][2][3] and is particularly problematic
>    when frequency data are unduly given causal interpretations.
[Wikipedia]([https://pages.github.com/](https://en.wikipedia.org/wiki/Simpson%27s_paradox))

#### Ejemplo 
>    E='Padecer de cierta enfermedad'
>    F='Ser fumadora'
>    1315 mujeres

>           Edad <50                 Edad >50
>            E   NoE                  E   NoE
>     F     155  295  450       F     90   42  132
>     NoF    50  412  167       NoF  364  201  565
>           265  412  617            454  243  697
>
>     P(E|F)  =155/450=0.344   P(E|F   )=90/132=0.682
>     P(E|NoF)=50/167=0.299    P(E|NoF)=364/565=0.694
>
>     Now, all ages
> 
>           Edad <50         
>            E   NoE       
>     F     245  337   582
>     NoF   474  378   732
>           359  656  1314
>
>     P(E|F)   = 245/582 = 0.42   <---!!!!
>     P(E|NoF) = 474/732 = 0.566
> 
>     ∴ SMOKING IS SIGNIFICANT, BUT AGE EVEN MORE SO

### Regression vs. Classification

* If the variables are numeric --> regression
* If the variables are qualitative --> classification

### How to use the results of simple linear regression to predict

Slanty graph, x_o,  x'     β0 + β1*x

E(Y|X=x) = β0 + β1*x + ϵi  <-- ϵi is the "random noise", hopefully with a normal distribution

Now an excercise: Modelos Lineales #1

OK, got A and B... try C

Link to slide "Interp. Mod. Reg. 

#### Linear regression function in R
`
out <- lm( y ~ x )
`
Link to slide "Coefficient of determination"

Tabla ANOVA

Now switching to new PDF of slides "Modelo de regresion lineal múltiple"

Ok, now Ej4

#### Making trendlines from LR in R
`
out <- lm( y ~ x )
plot(x,y)
abline(out)
`

## General Linear Model (GLM)

Motivación

Construccion de las variables indicadoras

Can only choose two modalidades

R: lm() --> glm()

Example Ej6

Sex=M) edss^ = 0.31 + 1.83(sex=M) + 0.09EdadAp, s^2=0.76

Slanty graph of edss vs Edad

Sex=F)  edss^ = 0.31 + 0 + 0.09EdadAp, s^2=??

Continuing with theory

### Individuos influyentes

Distancia de Cook <--> Mahalanobis

hij <-- hatvalues 

M1 <-- lm()

ei  M1$residuals

yhat M1$fittedvalues

leave the newer exercise

Last homework

Modelos de regression  viernes 8 de octubre is now DOMINGO 10 OCTUBRE

