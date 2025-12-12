## JACM-2510-5544 — Reproducible Research Repository
# Comparative Optimization of Vibrational Properties in Tensegrity Structures via the Spectral Element Method

This repository provides the full set of computational resources used in the article “Comparative Optimization of Vibrational Properties in Tensegrity Structures via the Spectral Element Method”.
It includes reproducible implementations for the Spectral Element Method (SEM), Finite Element Method (FEM), single-objective optimization (PSO), Monte Carlo uncertainty quantification, and all topological and geometric data used in the numerical experiments.

The structure is designed to ensure full transparency and replicability of the results published in the manuscript.


Content Overview
1. Spectral Element Method (SEM)

The folder code/sem contains the full SEM implementation used to compute vibrational properties of several tensegrity configurations.
Key functionalities include:
Element-level spectral stiffness and mass matrices
Coordinate transformation routines
Global matrix assembly
Modal extraction and frequency evaluation
The main entry point is:
SEM_vibration_generalAt.m

2. Finite Element Method (FEM)

The folder code/fem includes FEM-based verification models used to compare stiffness and modal characteristics with the SEM predictions.
This enables direct numerical cross-validation of the spectral framework.

3. Particle Swarm Optimization (PSO)

The folder code/pso contains:
General-purpose PSO solver (pso_main.m)
Optimization routines dedicated to tensegrity vibrational metrics
Pre- and post-processing (visualization, constraint handling, nullspace computation, etc.)
All optimization experiments from the manuscript can be reproduced by running:
run_optimization.m

4. Objective Functions

All optimization targets used in the study are stored in code/objectives/, including:
First natural frequency maximization
Modal density control
Dynamic efficiency
Prestress robustness
Mode separation
Frequency response function–based metrics

These functions are modular and can be combined for multi-objective formulations.

5. Monte Carlo Uncertainty Quantification

The folder code/montecarlo provides three independent uncertainty quantification pipelines:
MC_Ns.m: perturbations in nodal coordinates
MC_SelfStress.m: perturbations in prestress levels
MC_rhoarea.m: perturbations in axial mass/area properties
Supporting scripts allow fast visualization and statistical post-processing.

6. Data and Topologies

data/topologies/ contains all tensegrity configurations used in the article:
Connectivity matrices (C)
Nodal coordinate matrices (N)
Additional variants for benchmarking
These files ensure numerical reproducibility of all SEM, FEM, and optimization experiments.

7. Figures

The folder figures/ contains scripts used to generate the plots appearing in the manuscript (band diagrams, mode shapes, frequency trends, uncertainty distributions, etc., depending on final selection).



How to Reproduce the Results

1. Clone this repository:

git clone https://github.com/<user>/JACM-2510-5544.git


2. Open MATLAB R2022a or newer.

3. Add all subfolders to the MATLAB path:

addpath(genpath('code'));
addpath('data');


4. To reproduce:

SEM results: run SEM_vibration_generalAt.m

FEM comparisons: run run_fem_tensegrity.m

Optimizations: run run_optimization.m

Uncertainty quantification: run any of the MC scripts (e.g., MC_rhoarea.m)

Figures: execute scripts inside /figures/

Computational Environment

All simulations were executed on a workstation equipped with:

Intel Core i9 / AMD Ryzen 9 class CPU (multi-core)

32–64 GB RAM

MATLAB R2022a–R2024a

Parallel execution (PSO and Monte Carlo) used MATLAB’s Parallel Computing Toolbox.

License

Unless otherwise stated, the code in this repository is released under a permissive research-oriented license. Please cite the associated article when using or extending these materials.
