% Exercise 1.4. Write a new script that performs the same operations of Exercise 1.3 but using
% only dense matrices. Observe when your PC runs out of memory.


rng(23)
n = 470000 % matrix dimention

% False Sparse Matrix
Afsp = round(rand(n) - 0.49) .* rand(n);
dnst = nnz(Afsp) / numel(Afsp) % DENSITY OF Afsp


[P, L, U] = lu(Afsp);

%   • Compute the exact density of non-zero elements of L and U;
dnst_L = nnz(L) / numel(L) % DENSITY OF L
dnst_U = nnz(U) / numel(U) % DENSITY OF U
