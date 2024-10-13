%% Requirements for an Operation to be Considered a Norm:
%
% A function ||·|| that maps elements (vectors or matrices) to non-negative real numbers 
% is called a norm if it satisfies the following conditions:
%
% 1. Non-negativity and Definiteness:
%    - For any vector x (or matrix), the norm must satisfy:
%      ||x|| >= 0
%      ||x|| = 0 if and only if x = 0
%    - This means that the norm of a vector is always non-negative, and it is zero 
%      if and only if the vector is the zero vector.
%
% 2. Homogeneity (Scaling Property):
%    - For any vector x and any scalar α, the norm must satisfy:
%      ||αx|| = |α| * ||x||
%    - This means that multiplying a vector by a scalar α scales the norm by |α| 
%      (the absolute value of the scalar).
%
% 3. Triangle Inequality:
%    - For any two vectors x and y, the norm must satisfy:
%      ||x + y|| <= ||x|| + ||y||
%    - This means that the norm of the sum of two vectors is less than or equal 
%      to the sum of their norms, corresponding to the geometric interpretation 
%      of a triangle (the direct path between two points is shorter than any other path).
%
% In summary, a function ||·|| is a norm if it satisfies the following for all vectors 
% (or matrices) x and y, and for any scalar α:
% - Non-negativity and Definiteness: ||x|| >= 0, and ||x|| = 0 if and only if x = 0.
% - Homogeneity: ||αx|| = |α| * ||x||.
% - Triangle Inequality: ||x + y|| <= ||x|| + ||y||.
%
%% Examples of Norms:
%
% 1. L1-Norm (Manhattan Norm):
%    - Formula: ||x||_1 = sum(abs(x)) 
%    - Description: The L1-norm is the sum of the absolute values of the components of the vector.
%      It is also called the Manhattan or Taxicab norm because it represents the distance a
%      taxi would travel along the grid-like streets of Manhattan, only able to move along
%      one axis at a time.
%    - Application: L1-norm is useful in sparse models and settings where the emphasis is on
%      counting the magnitude of values, such as in compressed sensing and LASSO regression.
%
% 2. L2-Norm (Euclidean Norm):
%    - Formula: ||x||_2 = sqrt(sum(x.^2)) 
%    - Description: The L2-norm is the square root of the sum of the squares of the vector's
%      components. This is also known as the Euclidean norm, as it corresponds to the
%      straight-line distance in Euclidean space (the ordinary "distance" between two points).
%    - Application: The L2-norm is widely used in least-squares problems and optimization
%      techniques, where the goal is to minimize the sum of squared residuals.
%
% 3. L-Infinity Norm (Maximum Norm):
%    - Formula: ||x||_∞ = max(abs(x))
%    - Description: The L-infinity norm, also known as the maximum norm, is the largest absolute
%      value among the components of the vector. It essentially measures the "biggest" element
%      in the vector.
%    - Application: L-infinity norm is used in optimization problems where minimizing the largest
%      deviation is critical, such as in minimax problems.
%
% 4. Frobenius Norm (for matrices):
%    - Formula: ||A||_F = sqrt(sum(sum(A.^2))) 
%    - Description: The Frobenius norm of a matrix is the square root of the sum of the squares
%      of all elements in the matrix. It is a generalization of the Euclidean norm for matrices.
%    - Application: The Frobenius norm is commonly used in numerical analysis to measure the 
%      overall size of a matrix, and it is useful in matrix approximations and factorizations.
%
% 5. 2-Norm (Spectral Norm for matrices):
%    - Formula: ||A||_2 = max(svd(A))
%    - Description: The 2-norm (also called the spectral norm) of a matrix is the largest singular 
%      value of the matrix, which gives the maximum amount by which the matrix can "stretch" a 
%      vector. It corresponds to the largest eigenvalue in the special case of symmetric matrices.
%    - Application: The 2-norm is used in calculating the condition number of a matrix and is widely 
%      used in sensitivity analysis, as it measures how much the matrix can amplify errors.
%
% The L1, L2, and L-infinity norms are typically used for vectors, while the Frobenius and 2-norms 
% are used for matrices. The 2-norm is particularly important for determining the condition number 
% of a matrix, which assesses the sensitivity of a linear system to changes in the input.
