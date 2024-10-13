
%% How to set a random matrix with population
n = 100 % matrix dimention

N = 1000 % number of tests
desities = [];
for i = 1:N
    % Initializing a false sparse matrix
    A = round(rand(n) - 0.49) .* rand(n);
    
    % DENSITY OF A
    dnst = nnz(A) / numel(A);
    desities(1,i) = dnst;
end
mean(desities)


%% Using matlab function to set a sparse matrix:
m = 100;    % Number of rows
n = 100;    % Number of columns
density = 0.01;  % 1% of the elements are non-zero

% Create a sparse matrix with 1% non-zero elements
S = sprand(m, n, density);

% Display the number of non-zero elements
dnst = nnz(S) / numel(S)



