%% Exercise 2.1 (Gradient Method)
% Write a function called lab02_gradient_linsys that implements in Matlab 
% Algorithm 2.2 using a relative residual as stopping criterion. 
% Test your function on the linear system defined by the variables inside 
% the file lab02_sparse_linsys.mat.
clc 
clear

%% Algorithm 2.2 (Gradient Method)
% 1: x^(0) given
% 2: r^(0) <- b - A*x^(0)
% 3: k <- 0
% 4: while stopping criteria are not satisfied do
% 5:     z^(k) <- A * r^(k)
% 6:     α^(k) <- (r^(k)^T * r^(k)) / (r^(k)^T * z^(k))
% 7:     x^(k+1) <- x^(k) + α^(k) * r^(k)
% 8:     r^(k+1) <- r^(k) - α^(k) * z^(k)
% 9:     k <- k + 1
% 10: end while
% 11: x̂ <- x^(k)
% 12: return x̂
% 
%    ▷ because r^(k+1) = b - A * (x^(k) + α^(k) * r^(k))

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
function [x_found, k] = lab02_gradient_linsys(A, b, n, x0, rel_error)
    isPositiveDefinite(A);
    isSymmetric(A);

    x_found= x0;
    r = b - A * x_found;
    k = 0;
    while true
        z = A * r;

        % Calculate the ideal step lenght considering a SPD
        alpha = (transpose(r) * r) / (transpose(r) * z);

        % Storing for Relative error:
        x_before = x_found % Matlab automatically handles it
        x_found = x_found + alpha * r;
        r = r - alpha * z;
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
[x_found, k] = lab02_gradient_linsys(A, b, n, x0, 10e-10);

disp("k = " + k)
norm(x_found - x_sol)


