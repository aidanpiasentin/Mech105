## LU Factorization
The LuFactor algorithm performs LU factorization (a mathematical method of solving a system of linear equations using matrix manipulation) based on a square coefficient matrix [A] and its identity matrix [I]. this algorith dpends on one singular input, the square coefficient matrix [A] and will produce several outputs:
* P- the pivot matrix (the identity matrix modified by pivoting the [A] matrix)
* U- the upper triangular matrix
* L- the lower triangular matrix
* IMPORTANT: the relationship is [A]*[P]=[L]*[U]
