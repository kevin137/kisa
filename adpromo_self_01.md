# Probabilistic Modeling and Bayesian Networks

# Probability Distributions

## Types

For each application we need to select the most appropriate

### Domain
* Categorical / Ordinal / Continuous
* Bounded / Unbounded

### Shape
* Parameter-dependant
* Represented by the _moments_
* Best known: mean and variance

## Moments
Before discussing probability distributions, first some backround on moments...

### Moments about 0

The most important moment about 0 is the first order moment, 
the expectation value of the random variable itself, the _mean_.

$$
\mu_k' = E[X^k] = \int_{-\infty}^{\infty} x^k f(x) dx
$$

$$
\mu_1' = E[X] = \int_{-\infty}^{\infty} x f(x) dx
$$

$$
mean[f(x)] = E[X] = \int_{-\infty}^{\infty} x \cdot \text{(probability of distribution function of x)} \cdot dx
$$

$$
mean[f(x)] = E[X] = \text{(average weighted by relative probabilities)}
$$

In theory, higher order moments $(k>1)$ can be defined around 0, but second
and higher order moments are usually described about the central moment (mean).

### Moments about the mean

_Variance_ is the most important second-order $(k=2)$ moment, and the most 
fundamental moment about the mean (AKA the central moment).

$$
\mu_k' = E[(X - \mu_1')^k] = \int_{-\infty}^{\infty} (x - \mu_1')^k f(x) dx
$$

$$
\mu_2 = E[(X - \mu_1')^2] = \int_{-\infty}^{\infty} (x - \mu_1')^2 f(x) dx
$$

$$
var[f(x)] = E[(X - \mu_1')^2] = E[(f(x) - E[f(x)])^2] 
$$

... I'm getting stopped up here because of the differnence in Borja's 
nomenclature and Bishop's nomenclature x -> f(x), f(x)->p(x) 
