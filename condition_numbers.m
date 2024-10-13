%% Explanation of Condition Numbers and Sensitivity in Linear Systems
%
% The condition number of a matrix A is a measure of how sensitive the 
% solution of a linear system Ax = b is to small changes in b or A.
% It provides an upper bound on how much relative changes in the input 
% (perturbations in b) affect the relative changes in the solution x.
%
% For a matrix A, the condition number with respect to the 2-norm (spectral condition number) is:
%
%   kappa(A) = ||A||_2 * ||A^(-1)||_2
%

% kappa is only a way to refer to the cond() number => kappa(A) = cond(A)

% Where:
%   - ||A||_2 is the 2-norm (largest singular value of A).
%   - ||A^(-1)||_2 is the 2-norm of the inverse of A (the reciprocal of 
%     the smallest singular value of A).
%
% The condition number can be used to bound the relative error in the solution x
% compared to the relative error in the input b. Consider the perturbed system:
%
%   A(x + delta_x) = b + delta_b
%
% This can be written as:
%
%   A * delta_x = delta_b
%
% Solving for delta_x:
%
%   delta_x = A^(-1) * delta_b
%
% Taking the norm of both sides and using the inequality of the multiplication, we get:
%
%   ||delta_x|| <= ||A^(-1)|| * ||delta_b||
%
% Dividing by ||x||, we obtain the relative change in x:
%
%   (||delta_x|| / ||x||) <= (||A^(-1)|| * ||delta_b|| / ||x||)
%
% Since ||b|| = ||A * x||, we use the bound:
%
%   ||A * x|| <= ||A|| * ||x||
%
% Therefore, ||x|| >= ||b|| / ||A||. Substituting this into the previous inequality:
%
%   (||delta_x|| / ||x||) <= ||A^(-1)|| * ||A|| * (||delta_b|| / ||b||)
%
% Recognizing that ||A^(-1)|| * ||A|| is the condition number kappa(A), we have:
%
%   (||delta_x|| / ||x||) <= kappa(A) * (||delta_b|| / ||b||)
%
% This equation shows that the relative error in the solution x is amplified 
% by the condition number kappa(A) with respect to the relative error in b.
%
% - If kappa(A) is large, small errors in b can lead to large errors in x.
% - If kappa(A) is small (close to 1), the solution is stable and the errors
%   in x will be comparable to the errors in b.
%
% Therefore, the condition number is a key indicator of the sensitivity and 
% numerical stability of a linear system. Well-conditioned matrices have 
% small condition numbers and are stable, while ill-conditioned matrices 
% have large condition numbers and are prone to significant errors.
%
% This script will generate a visual demonstration of the impact of the 
% condition number on the sensitivity of the solution to perturbations in b.

%% Reciprocal Condition Number (rc)
% refers to the inverse of the condition number



%% Demonstration of Norms and Condition Numbers

disp("Exercise: Norms and Condition Numbers")

% 1. Initialize a random seed for reproducibility
rng(23);

% 2. Create a random matrix A ∈ R(n×n) with uniform distribution [0,1] and 
% a random vector b

n = 5;
A = rand(n);
x_target = ones(n, 1); % Exact solution vector (1, 1, ..., 1)
b = A * x_target; % Vector b

% 3. Solve the system Ax = b
x = A \ b; % Solve Ax = b

% Display matrix and vector
disp('Matrix A:');
disp(A);

disp('Vector b:');
disp(b);

disp('Solution x (Ax = b):');
disp(x);

%% 4. Compute and display different matrix norms for matrix A

disp('Matrix Norms for A:');
disp(['1-Norm (maximum column sum): ', num2str(norm(A, 1))]);
disp(['Infinity Norm (maximum row sum): ', num2str(norm(A, inf))]);
disp(['Frobenius Norm (square root of sum of squares): ', num2str(norm(A, 'fro'))]);
disp(['2-Norm (spectral norm): ', num2str(norm(A, 2))]);

%% 5. Compute and display different vector norms for vector b

disp('Vector Norms for b:');
disp(['1-Norm (sum of absolute values): ', num2str(norm(b, 1))]);
disp(['Infinity Norm (maximum absolute value): ', num2str(norm(b, inf))]);
disp(['2-Norm (Euclidean norm): ', num2str(norm(b, 2))]);

%% 6. Compute and display different condition numbers for matrix A

% Condition number measures how sensitive the solution of a linear system 
% is to changes in the input

disp('Condition Numbers for A:');
disp(['2-Norm Condition Number (default): ', num2str(cond(A))]);
disp(['1-Norm Condition Number: ', num2str(cond(A, 1))]);
disp(['Infinity-Norm Condition Number: ', num2str(cond(A, inf))]);


% Eigenvalue Condition Number
eig_cond = condeig(A); % condeig returns a vector of condition numbers
disp('Eigenvalue Condition Numbers:');
for i = 1:length(eig_cond)
    disp(['Eigenvalue Condition Number ' num2str(i) ': ' num2str(eig_cond(i))]);
end

% Estimated condition number for large sparse matrices
disp(['1-Norm Condition Number Estimate: ', num2str(condest(A))]);


%% 7. Applications and insights

% Display residual norms to assess accuracy
disp('Residual Norms (accuracy of the solutions):');
disp(['Residual for Ax=b (2-Norm): ', num2str(norm(A*x - b))]);

% Application insights:
% 1. A low condition number (close to 1) indicates that the matrix is well-conditioned,
%    meaning small changes in b will result in small changes in x.
% 2. A high condition number indicates that the matrix is ill-conditioned and that 
%    even small errors in the input data (or round-off errors) could lead to large errors 
%    in the solution x.
% 3. The condition number can help predict the sensitivity of the solution. When working
%    with numerical solutions, especially in scientific computing, having a small condition
%    number is essential for obtaining reliable results.

%% 8. Comparison of Matrices with Low and High Condition Numbers

% 1. Set up the problem and initialize
n = 5; % Size of the matrix
rng(23); % For reproducibility

% 2. Generate a well-conditioned matrix (low condition number)
A_low_cond = rand(n);
A_low_cond = A_low_cond + eye(n); % Adding identity to improve conditioning
cond_A_low = cond(A_low_cond); % Condition number of the well-conditioned matrix

% 3. Generate an ill-conditioned matrix (high condition number)
A_high_cond = rand(n) * 1e-5; % Scale down the matrix to make it poorly conditioned
A_high_cond(1, 1) = 1; % Manually modify one element to increase condition number
cond_A_high = cond(A_high_cond); % Condition number of the ill-conditioned matrix

% 4. Create a target vector x (true solution) and compute corresponding b for both systems
x_true = ones(n, 1); % True solution
b_low = A_low_cond * x_true;
b_high = A_high_cond * x_true;

% 5. Add a small perturbation to the right-hand side vectors
epsilon = 1e-3; % Small perturbation
b_low_perturbed = b_low + epsilon * randn(n, 1);
b_high_perturbed = b_high + epsilon * randn(n, 1);

% 6. Solve both systems with the perturbed b
x_low_perturbed = A_low_cond \ b_low_perturbed;
x_high_perturbed = A_high_cond \ b_high_perturbed;

% 7. Compute and display condition numbers
disp(['Condition number of well-conditioned matrix: ', num2str(cond_A_low)]);
disp(['Condition number of ill-conditioned matrix: ', num2str(cond_A_high)]);

% 8. Plot the original solution vs the perturbed solution

figure;
subplot(2, 1, 1);
plot(x_true, 'o-', 'DisplayName', 'True Solution');
hold on;
plot(x_low_perturbed, 'x-', 'DisplayName', 'Perturbed Solution (Low Cond)');
title(['Well-Conditioned Matrix (Cond(A) = ' num2str(cond_A_low) ')']);
xlabel('Element Index');
ylabel('Solution Value');
legend show;
grid on;

subplot(2, 1, 2);
plot(x_true, 'o-', 'DisplayName', 'True Solution');
hold on;
plot(x_high_perturbed, 'x-', 'DisplayName', 'Perturbed Solution (High Cond)');
title(['Ill-Conditioned Matrix (Cond(A) = ' num2str(cond_A_high) ')']);
xlabel('Element Index');
ylabel('Solution Value');
legend show;
grid on;

% 9. Comment on the results
disp('The graph shows how small perturbations in b lead to different deviations in the solution,');
disp('depending on whether the matrix is well-conditioned (low condition number) or ill-conditioned (high condition number).');

