% Exercise 1.1 (Basic Linear Systems). Write a script file where:
disp("Exercise 1.1")

% 1. The random seed is 23, for reproducibility.
rng(23); 
disp(rng)

% 2. A matrix A ∈ R(n×n) is initialized with elements randomly sampled 
% from a uniform distribution in [0, 1]. Set n = 5 for simplicity.
n = 5;
A = rand(n);

% 3. A vector b ∈ R^n is initialized such that the exact solution of Ax = b 
% is the vector x* = (1, ..., 1).
x_target = ones(n, 1); 
b = A * x_target; 

% 4. A set of N vectors b1, ..., bN ∈ R^n are initialized such that 
% bi = b + ξi, where ξi ∈ U([0, 1]^n), for each i = 1, ..., N.
N = 10;
B = NaN(n, N); % Pre-allocating matrix B
for i = 1:N
    B(:,i) = b + rand(n,1);
end

% 5. A diagonal matrix D ∈ R(n×n) is initialized with elements randomly sampled 
% from a uniform distribution in [0, 1].
D = diag(rand(1,n));

% 6. Solve the linear systems Ax = b, Dx = b, and Ax = bi, for each i = 1, ..., N.

% Solving Ax = b
disp('Solution Ax=b:')
x = A\b; 
disp(x)

% Solving Dx = b
disp('Solution Dx=b:')
x = D\b; 
disp(x)

% Solving Ax = bi for each i = 1, ..., N
disp('Solution Ax=b_i:')
X = A\B;
disp(X)

% 7. Compute the norms of the residuals of the numerical solutions.

% Residual norm for Ax = b
disp('Residual Norm Ax=b:')
residual_norm_A = norm(A*x - b);
disp(residual_norm_A)

% Residual norm for Dx = b
disp('Residual Norm Dx=b:')
residual_norm_D = norm(D*x - b);
disp(residual_norm_D)

% Residual norms for Ax = bi
disp('Residual Norms Ax=b_i:')
residual_norm_B = sqrt(sum((A*X - B).^2, 1)); 
% This one is different because each column is a different problem
disp(residual_norm_B)

% 8. Compute the condition number of A and D and comment the results.

disp('Condition number of A:')
k_A = cond(A);
disp(k_A)

disp('Condition number of D:')
k_D = cond(D);
disp(k_D)
