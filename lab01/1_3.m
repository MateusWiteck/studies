% Exercise 1.3. 
clc
clear
% Download, run, and read the script lab01_sparse_examples.m/.py carefully. 
% Then write a new script file where, for each n = 200, 400, ..., 2000, the 
% following operations are performed:
%
%   • Initialize a random sparse matrix A ∈ ℝ^n×n with density 0.01 (0.1 in Python);
rng(23)
n = 30000 % matrix dimention

% False Sparse Matrix
Afsp = round(rand(n) - 0.49) .* rand(n);
% dnst = nnz(Afsp) / numel(Afsp) % DENSITY OF Afsp

Asp = sparse(Afsp);

%   • Compute the exact density of non-zero elements of A;
dnst = nnz(Asp) / numel(Asp) % DENSITY OF A

%   • Compute L, U ∈ ℝ^n×n through the LU Factorization of A;
[P, L, U] = lu(Asp);

%   • Compute the exact density of non-zero elements of L and U;
dnst_L = nnz(L) / numel(L) % DENSITY OF L
dnst_U = nnz(U) / numel(U) % DENSITY OF U

%   • Update the script file, increasing the maximum value of n and looking for the value that 
%     runs out of memory on your PC.
%

% TODO

% In the end, plot the evolution of the density values for A, L, and U, with respect to n 
% and comment on the results. Moreover, spy the collocation of the non-zero values of the 
% last matrices A, L, and U computed.



%% n= 10000
% dnst_L =
% 
%     0.4844
% 
% 
% dnst_U =
% 
%    1.0000e-04
