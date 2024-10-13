%% Ill-Conditioning and the Backslash Operator (\)
% This script demonstrates how the backslash operator is used to solve
% a system of linear equations, and why it is sensitive to ill-conditioned matrices.

% Clear workspace and command window
clear;
clc;

%% Define a Well-Conditioned Matrix
A_well = [3 1; 1 2];
b_well = [5; 5];

% Solve using the backslash operator
x_well = A_well \ b_well;

% Display results for the well-conditioned matrix
disp('Solution for well-conditioned matrix (A_well \ b_well):');
disp(x_well);

% Check the condition number of A_well
cond_well = cond(A_well);
disp(['Condition number of A_well: ', num2str(cond_well)]);

%% Define an Ill-Conditioned Matrix
epsilon = 1e-10;  % Small value to make the matrix nearly singular (ill-conditioned)
A_ill = [1 1; 1 1+epsilon];
b_ill = [2; 2];

% Solve using the backslash operator
x_ill = A_ill \ b_ill;

% Display results for the ill-conditioned matrix
disp('Solution for ill-conditioned matrix (A_ill \ b_ill):');
disp(x_ill);

% Check the condition number of A_ill
cond_ill = cond(A_ill);
disp(['Condition number of A_ill: ', num2str(cond_ill)]);

%% Explanation of Sensitivity to Ill-Conditioning
% The backslash operator uses numerical methods to solve systems of equations.
% When the matrix is well-conditioned, the solution is stable and accurate.
% However, when the matrix is ill-conditioned, even small changes in the matrix
% or the right-hand side (b) can cause large changes in the solution, making it unstable.

% To demonstrate sensitivity, let's perturb the right-hand side slightly
b_ill_perturbed = [2; 2 + 1e-9];
x_ill_perturbed = A_ill \ b_ill_perturbed;

% Display the solution for the perturbed system
disp('Solution for ill-conditioned matrix with a slight perturbation in b:');
disp(x_ill_perturbed);

% Difference between the original solution and the perturbed one
diff_solution = norm(x_ill - x_ill_perturbed);
disp(['Difference in solutions due to small perturbation: ', num2str(diff_solution)]);
