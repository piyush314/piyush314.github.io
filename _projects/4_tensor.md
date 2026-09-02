---
layout: page
title: Tensor Factorization & NMF
description: Scalable Non-negative and Constrained Tensor Decomposition
importance: 4
category: research
related_publications: true
---

## The Tensor Factorization Challenge

High-dimensional data is everywhere—hyperspectral images, time-evolving networks, multi-way scientific measurements. Tensor decompositions extract interpretable structure from this data, but scaling to real-world sizes requires confronting two hard problems: **massive data volumes** and **non-negativity constraints** that make optimization non-convex.

This research thread develops scalable algorithms for constrained tensor factorization, with particular focus on non-negative matrix factorization (NMF) and its generalizations.

## Research Contributions

### Multifrontal NMF (PPAM 2019)

Standard NMF algorithms treat the problem as dense optimization. But sparse data induces structure in the computation—structure that mirrors the multifrontal method from sparse direct solvers. By recognizing this connection, we developed an NMF algorithm that:

- Exploits sparsity patterns for efficient memory access
- Uses elimination tree parallelism for concurrent updates
- Achieves significant speedups on sparse datasets

### FUNNL: Fast Nonlinear Nonnegative Unmixing (Book Chapter, 2023)

Energy materials characterization produces hyperspectral data where each pixel is a mixture of pure component spectra. FUNNL combines physics-informed constraints with scalable NMF to unmix these signals, enabling automated analysis of battery materials and catalysts.

### Accelerated Constrained Sparse Tensor Factorization (ICPP 2024)

Extending beyond matrices to tensors, this work develops GPU-accelerated algorithms for sparse CP decomposition with non-negativity and other constraints. Key innovations:

- Massively parallel MTTKRP (matricized tensor times Khatri-Rao product)
- Constraint-aware update schemes
- Scaling to billion-element tensors

### Fast Active-Set NNLS (IEEE BigData 2025)

Non-negative least squares (NNLS) is the computational kernel underlying NMF. Our active-set thresholding method achieves substantial speedups over standard solvers by efficiently tracking which variables are at their bounds.

## Applications

| Domain              | Problem                | Our Contribution          |
| ------------------- | ---------------------- | ------------------------- |
| Energy Materials    | Hyperspectral unmixing | FUNNL algorithm           |
| Recommender Systems | Matrix completion      | Scalable NMF              |
| Community Detection | Network clustering     | Sparse tensor methods     |
| Scientific Imaging  | Feature extraction     | Constrained decomposition |

## Key Publications

- P. Sao, R. Kannan. _Multifrontal Non-negative Matrix Factorization._ PPAM 2019 {% cite sao2019multifrontal %}.
- J.A. Graves, T.F. Blum, P. Sao, M. Chi, R. Kannan. _FUNNL: Fast Nonlinear Nonnegative Unmixing for Alternate Energy Systems._ Knowledge-Guided Machine Learning, 2023 {% cite graves2023funnl %}.
- Y. Soh, R. Kannan, P. Sao, J. Choi. _Accelerated Constrained Sparse Tensor Factorization on Massively Parallel Architectures._ ICPP 2024 {% cite soh2024accelerated %}.
- B. Cobb, R. Kannan, K. Pieper, P. Sao, et al. _Fast Active-Set Thresholding Method for Nonnegative Least Squares._ IEEE BigData 2025 {% cite cobb2025fast %}.
