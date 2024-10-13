% MATLAB Summary for Programmers with Linear Algebra Knowledge

% 1. Basic Structure and Syntax

% Printing to the screen
disp('Hello, MATLAB!');  % Prints a message to the command window
fprintf('The value of A is: %d\n', 5);  % Prints formatted text (like printf in C)

% Variables
A = 5;      % Scalar variable
B = [1, 2; 
    3, 4];  % 2x2 Matrix
C = 1:10;   % Row vector from 1 to 10

% Comments
% This is a comment

% Basic Operations
D = B * B;  % Matrix multiplication
E = B .* B; % Element-wise multiplication

% 2. Matrix and Vector Manipulation

% Creating matrices
A = [1, 2, 3; 4, 5, 6; 7, 8, 9];  % 3x3 Matrix
B = ones(3,3); % 3x3 Matrix of ones
C = zeros(3,3); % 3x3 Matrix of zeros
D = eye(3); % 3x3 Identity matrix (eye because sounds like "I")

% Indexing
A(2, 3)  % Access the element in the 2nd row, 3rd column
A(:, 1)  % All rows from the 1st column

% Common operations
A'        % Transpose of A
inv(A)    % Inverse of A
det(A)    % Determinant of A
A * B     % Matrix multiplication

% 3. Control Flow

% If/Else
x = 5;
if x > 0
    disp('Positive');
else
    disp('Negative');
end

% Loops
for i = 1:10
    disp(i);
end

x = 10;
while x > 0
    x = x - 1;
end

% 4. Functions

% Defining functions
function y = quadrado(x)
    y = x^2;
end

% Call
resultado = quadrado(5);  % Returns 25

% 5. Plotting and Data Visualization

% Simple Plot with Transposed x
x = 0:0.1:10;
x_transposed = x.';  % Transpose x
y = sin(x_transposed);  % You can still apply sin to the transposed vector
plot(x_transposed, y);  % Plot with the transposed x

% 3D Plot
[X, Y] = meshgrid(-5:0.5:5, -5:0.5:5);
Z = X.^2 + Y.^2;
surf(X, Y, Z);  % 3D Surface plot

% 6. Linear Algebra

% Solving Linear Systems
A = [1, 2; 3, 4];
b = [5; 6];
x = A\b;  % Solves A*x = b

% LU, SVD Decomposition
[L, U, P] = lu(A);  % LU decomposition
[U, S, V] = svd(A); % Singular Value Decomposition (SVD)

% 7. File Handling

% MAT File
save('data.mat', 'A');  % Saves matrix A in a MAT file
load('data.mat');  % Loads the MAT file

% 8. Performance Tips
% - Avoid loops by using vectorized operations
% - Use 'parfor' for parallel loops
% - Use 'bsxfun' for efficient broadcasting operations

% 9. Extensions and Integrations

% Python Integration
py.list({'a', 'b', 'c'})

% 10. Generating Random Numbers

% Generate random numbers
r = rand();       % Generates a random number between 0 and 1
r_matrix = rand(3);  % Generates a 3x3 matrix of random numbers between 0 and 1
r_int = randi([1, 100], 1, 5);  % Generates a row vector of 5 random integers between 1 and 100
