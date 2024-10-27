%% Exercise 2.2 (Conjugate Gradient Method)
% Write a function called lab02_cg_linsys that implements in Matlab 
% Algorithm 2.4 using a relative residual as stopping criterion. 
% Test your function on the linear system defined by the variables inside 
% the file lab02_sparse_linsys.mat.
clc
clear
%% Algorithm 2.4 (Conjugate Gradient Method)
% 1: x^(0) given
% 2: r^(0) <- b - A*x^(0)
% 3: p^(0) <- r^(0)
% 4: k <- 0
% 5: while stopping criteria are not satisfied do
% 6:     z^(k) <- A * p^(k)
% 7:     α^(k) <- (r^(k)^T * p^(k)) / (p^(k)^T * z^(k))
% 8:     x^(k+1) <- x^(k) + α^(k) * p^(k)
% 9:     r^(k+1) <- r^(k) - α^(k) * z^(k)
% 10:    β^(k+1) <- (r^(k+1)^T * r^(k+1)) / (p^(k)^T * z^(k))
% 11:    p^(k+1) <- r^(k+1) + β^(k+1) * p^(k)
% 12:    k <- k + 1
% 13: end while
% 14: x̂ <- x^(k)
% 15: return x̂

%% Conditions for Symmetric Positive Defined

function isPositiveDefinite(A)
    eigenvalues = eig(A);
    is_pos_def = all(eigenvalues > 0);
    if is_pos_def
       disp("Positive")
    end
end

function isSymmetric(A)
    if issymmetric(A)
        disp("Symmetric ")
    end
end

%% Function Implementation


% Defining functions
function [x_found, k] = lab02_cg_linsys(A, b, n, x0, rel_error)
    isPositiveDefinite(A);
    isSymmetric(A);

    x_found= x0;
    r = b - A * x_found;
    p = r;
    k = 0;
    while true
        z = A * p;
        alpha = (transpose(r) * p) / (transpose(p) * z);
        x_before = x_found;
        x_found = x_found + alpha * p;
        r = r - alpha * z;
        betha = (transpose(r) * r) / (transpose(p) * z);
        p = r + betha * p;
        k = k + 1;
        improvement = x_found - x_before;
        if norm(improvement) < rel_error
            break
        end

    end 
end

data = load('lab02_sparse_linsys.mat');
[A, b, n, x0, x_sol] = deal(data.A, data.b, data.n, data.x0, data.x_sol);

% Call
[x_found, k] = lab02_cg_linsys(A, b, n, x0, 10e-10);

disp(k)
norm(x_found - x_sol)


