## Markov chains

### Classification of states

#### accessible
A state j is **accessible** from state i if p⁽ⁿ⁾ᵢⱼ > 0 
for any n ≥ 1 
(one direction)

#### communicated
If state j is accessible from state i 
and state i is accessible from state j, 
then it is said that i and j are **communicated**
(bidirectional, both accessible from each other)

#### equivalence relationship
The communication relationship is an 
**equivalence relationship**
  1. Partition of states set into **separated classes**
  2. Communicated states belong to the same class
  (if states are communicated, they are in the same
   class if not, they are separated. It seems to work a
   little like non-hierarchical clustering)

#### irreducible chain
The chain is **irreducible** if there is only one 
communicating class.

#### transient
A state i is **transient** if there is a state j 
that is accessible from i and the probability of 
not going back to state i is positive. It will be 
visited only a finite number of times.

#### recurrent
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

## Markov processes
