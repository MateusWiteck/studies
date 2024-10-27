%% Introduction
% We are manimizing a function that depends on random variables.
% max R(F(x, omega) for x € X

% X feasible space
% R operator

%% Newsvendor

% c: cost
% p: sellling price
% d = D(omega) : demand
% P(x,omega) = p min[D(omega), x] - cx : proffit

% maxE[P(x, omega)]
% To solve this we need to solve a difficult integral to find the expected value
% This is the problem in this kind of problem

p = 10
c = 1

% Prob[D = d] = 
prob = {
0:0.4, % 0.4 of probability of the real demmand be 0
1:0.3,
2:0.2,
3:0.1
}
% Usually we have a D ~D(10⁶, )

disp(prob(0))

%% Payed Solvers
% GUROBI Optimization (to activate the licence you need to be at polito)
% 
% 
% 
% 
%% Monte Carlo
% Find estimation for the expected value
% Standar numerical integration is wery expensive for big dimensionality
% 
% 1. estimate the expected value for x (h_barr)
% 2. With the expected value find a estimation for the variance
% 3. central limit shows that h_barr ~N(exp(h(x)), 1/
% 4. We dont know the real variance but we still using the normal (its
% estatistical error, but reduce the computational cost)


% Whats the N that I need to get a especific width w?
% N = v_N * 4 * z_alpha^2 / w^2
% But v_N depends on N

% The difference to standard integration methods is that montecarlo do not
% receive a linespace but random samplings.


%% Random numbers

%% Assembly to Order examples
% Two stage problem: first we dont know the demmand, and after we know

% S

%% Stability
% in Sample: Create samples of the same lengh N_scenario and see the solution. Try
% different lenghs until they converge.

% 


% Separable problems

%% Problem of the stock 


%% 
% We compute t
% we dont put any king. Gurobi dont know what is behind the equations.


% We cannot use the central limit teorem sometimes
%

%% Transient and Steady State Behavior

