# Numerical and Stochastic Optimization Studies

This repository contains a series of labs and self-practice exercises for the **Numerical and Stochastic Optimization** course. Each lab focuses on specific methods and techniques for solving linear systems and optimization problems. Below is an overview of each lab's main topics and objectives.

---
## [Self-Practice Exercises](https://github.com/MateusWiteck/studies/tree/numerical_and_stochastic_optimization/python_otimization_problems)

The following Python notebooks are included for hands-on practice. Each notebook addresses a different optimization problem, allowing users to apply concepts from numerical and stochastic optimization in real-world scenarios.

- **news_vendor.ipynb**: Implements the news vendor model to optimize inventory decisions under uncertain demand, balancing cost and availability.
- **pizza_restaurant.ipynb**: Models an optimization problem for a pizza restaurant, focusing on resource allocation and maximizing service efficiency.
- **plant_location.ipynb**: Solves a plant location optimization problem, considering cost minimization and strategic placement to optimize distribution.
- **gurobi.ipynb**: Demonstrates the basics of using Gurobi for optimization tasks.

---

These notebooks are designed for independent practice and reinforce the techniques covered in the labs.


---

## [Lab 03 - Steepest Descent with Backtracking](https://github.com/MateusWiteck/studies/tree/numerical_and_stochastic_optimization/lab03)
**Objective:**  
Lab 03 introduces the steepest descent method with a focus on backtracking as a line search technique. This lab explores the principles of backtracking to optimize step sizes and improve convergence in gradient-based optimization.

**Contents:**  
- **Backtracking:** Explanation and implementation of backtracking line search to dynamically adjust step sizes for optimal descent.
- **Exercises:** Practical exercises applying the steepest descent method with backtracking to test understanding and implementation skills.

---

## [Lab 02 - Iterative Methods for Linear Systems](https://github.com/MateusWiteck/studies/tree/numerical_and_stochastic_optimization/lab02)
**Objective:**  
Lab 02 covers iterative methods for solving linear systems, particularly focusing on gradient-based techniques for optimization and convergence analysis.

**Contents:**  
- **The Gradient Method:** Introduction to the gradient method, discussing its sequential approach and suitability for specific linear systems.
  - **Sequence of the Gradient Method:** Detailed exploration of the gradient method's iterative sequence.
  - **Convergence Properties:** Analysis of conditions under which the gradient method converges and its expected rate of convergence.
- **Conjugate Gradient Method:** Examination of the conjugate gradient method as an improvement over the standard gradient method.
  - **Preconditioning:** Techniques for preconditioning to enhance the efficiency of the conjugate gradient method.
- **Other Iterative Methods:** Overview of additional iterative methods that can be applied to linear systems.
- **Exercises:** Implementating Gradient Method and Conjugate Gradient Method.
---

## [Lab 01 - Direct Methods for Linear Systems](https://github.com/MateusWiteck/studies/tree/numerical_and_stochastic_optimization/lab01)
**Objective:**  
Lab 01 focuses on direct methods for solving square linear systems. This lab provides a foundation in solving linear equations efficiently and introduces concepts such as the condition number and matrix fill-in phenomenon.

**Contents:**  
- **Square Matrices:** Discussion on properties and challenges of solving linear systems with square matrices.
- **Gaussian Elimination:** Implementation of Gaussian elimination as a fundamental method for solving linear equations.
- **Square Linear Systems:** Exploration of specific approaches for square systems.
- **Condition Number:** Introduction to the condition number as a measure of stability and sensitivity in linear systems.
- **Direct Methods in MATLAB & Python:** Practical examples of implementing direct methods in both MATLAB and Python.
- **Fill-In Phenomenon:** Insight into the fill-in effect in sparse matrices during elimination processes.
- **Exercises:** Exercises to apply direct methods and analyze their computational efficiency and stability.

---

## Usage
To run these labs, ensure you have [MATLAB](https://www.mathworks.com/products/matlab.html) or [Python](https://www.python.org/) installed. Open each script in your preferred environment to explore the code and experiment with parameters.

## License
This code is proprietary and intended exclusively for personal educational use by the author. Redistribution, modification, or commercial use without explicit permission is prohibited.
