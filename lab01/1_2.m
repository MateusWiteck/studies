% Exercise 1.2 (Ill-Conditioned Problem).
% Write a script file where you solve a linear system Ax = b such that:

A = [ 0.835  0.667;
      0.333  0.266 ];

% and b ∈ R^2 is the result of an experiment, measured using an instrument
% with tolerance ±0.001. For simplicity, assume to have the following 11 
% measurements of b:

% b_i = b* - 0.001 + (i - 1) * 0.0002,  ∀ i = 1, ..., 11,

% where b* = (0.168, 0.067) is the exact vector of known terms.

b_target = [0.168;
            0.067]
N = 11;
B = zeros(2, N);
for i = 1:N
    B(:,i) = b* - 0.001 + (i - 1) * 0.0002;
end
B

% Then:
% 1. Solve the linear systems Ax = b_i, for each i = 1, ..., N.
X = A\B



% 2. Compute the norms of the residuals of the numerical solutions; i.e., 
%    ||A * x_i - b_i||, for each i = 1, ..., N.
Resid = A*X - B
for i = 1:N
    Residual_norm(:,i) = norm(Resid(:,i));
end
Residual_norm

% 3. Compute the condition number of A and comment the results.
cond_number = cond(A)

disp("> Its possible to see that with this little error inserted in b we" + ...
    " have a completelly different result. It occurs because the matrix A " + ...
    "has a condition number with 10^6 of magnitud")
x_target = A\b_target

perc_diff = zeros(2, N);
for i = 1:N
    perc_diff(:,i) = abs(X(:,i) ./ x_target);
end
perc_diff
