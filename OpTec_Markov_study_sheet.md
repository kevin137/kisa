## Markov chains

### Classification of states

#### accessible state
A state j is **accessible** from state i if p⁽ⁿ⁾ᵢⱼ > 0 
for any n ≥ 1 
(one direction)

#### communicated state
If state j is accessible from state i 
and state i is accessible from state j, 
then it is said that i and j are **communicated**
(bidirectional, both accessible from each other)

  ##### equivalence relationship
  The communication relationship is an 
  **equivalence relationship**
    1. Partition of states set into **separated classes**
    2. Communicated states belong to the same class
    (if states are communicated, they are in the same
     class if not, they are separated. It seems to work a
     little like non-hierarchical clustering)

  ##### irreducible chain
  The chain is **irreducible** if there is only one 
  communicating class.

#### transient state
A state i is **transient** if there is a state j 
that is accessible from i and the probability of 
not going back to state i is positive. It will be 
visited only a finite number of times.

#### recurrent state
A state i is **recurrent** if, after entering this 
state, the process goes back to the state in a 
posterior time. If i is recurrent and j is 
communicated with i, then j is recurrent.
Recurrence is a property of the class.

#### absorbing
A state i is **absorbing** if when the process 
accesses that state it never leaves it. No other 
state is accessible.
(note that all absorbing classes are recurrent, 
 but not all recurrent classes are absorbing)

All the states of a finite state irreducible 
Markov chain are recurrent.

#### periodic state
A state i is **periodic** if its period d(i) > 1
(see definition of d in that of period below)

#### aperiodic state
A state is **aperiodic** if its period d(i) = 1

  ##### period (property of a state) 
  A **period** of a state i is the largest integer d 
  satisfying the following property: 

    p⁽ⁿ⁾ᵢᵢ = 0, whenever n is not divisible by d.

  The period of i is shown by d(i).

  If p⁽ⁿ⁾ᵢᵢ = 0 for all n > 0, then d(i) = ∞.

  ##### periodicity (property of a class) 
  Periodicity is a class property. If state i has 
  period d and j is communicated with i, then j has 
  period d.

#### Ergodic state
recurrent, aperiodic, and has a finite mean 
recurrence time 
(positive recurrent)

  ##### Ergodic Markov chain
  An _irreducible_, _aperiodic_, _positive recurrent_ 
  _(ergodic)_ Markov chain. 
  **All states are ergodic.**

### Rules for the classification of states

## Markov processes
