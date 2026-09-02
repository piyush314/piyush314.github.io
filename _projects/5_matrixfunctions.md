---
layout: page
title: Matrix Functions & Numerical Methods
description: Algorithms for Log-Determinants, Neumann Series, and Matrix Approximation
importance: 5
category: research
related_publications: true
---

## Beyond Matrix Inversion

Many computational tasks require not the inverse of a matrix, but _functions_ of matrices: log-determinants for Gaussian process likelihoods, matrix exponentials for differential equations, polynomial approximations for preconditioning. These matrix functions are expensive to compute exactly, so we use approximations—but how accurate are they, and can we compute them faster?

This research thread develops new algorithms and theoretical foundations for matrix function computation.

## Neumann Series with Radix Kernels (2026)

The truncated Neumann series approximates (I - A)⁻¹ by summing powers of A:

$$S_k(A) = I + A + A^2 + \cdots + A^{k-1}$$

**The naive approach** requires k-1 matrix multiplications. **Our key insight**: by using cleverly constructed "radix kernels," we can achieve the same accuracy with far fewer multiplications.

| Radix        | Kernel Products | Total per Step | Efficiency |
| ------------ | --------------- | -------------- | ---------- |
| 2 (binary)   | 0               | 2              | 2.00       |
| 3 (ternary)  | 1               | 3              | 1.89       |
| 5 (quinary)  | 2               | 4              | 1.72       |
| **9 (ours)** | 3               | 5              | **1.58**   |
| 15 (approx)  | 4               | 6              | 1.54       |

We construct the **first exact radix-9 kernel** (3 products for a factor-9 series extension) and develop a general framework for approximate kernels with controlled spillover. The result: **~25% fewer matrix multiplications** at the same accuracy.

## Trace Powers and Log-Determinants (2026)

Computing log det(A) is essential for:

- Gaussian process marginal likelihood
- Partition functions in statistical physics
- Information-theoretic quantities

The standard approach uses stochastic trace estimation: approximate tr(log A) via tr(A⁻¹), tr(A⁻²), etc. But **what do these trace powers actually reveal?**

We derive:

- **Closed-form estimators** relating trace powers to log-determinants
- **Certificates** that verify when estimates are reliable
- **Failure mode analysis** showing when the approach breaks down

This work provides theoretical foundations for a widely-used computational technique.

## Forward Error Bounds for Tensor Chains (2025)

Low-precision arithmetic (FP16, BF16) accelerates tensor computations but introduces rounding errors. For tensor times matrix chains—common in neural networks and scientific computing—we derive:

- Forward error bounds as functions of precision
- Efficient algorithms that minimize error accumulation
- GPU implementations achieving both speed and accuracy

## Key Publications

- P. Sao. _Fast Evaluation of Truncated Neumann Series by Low-Product Radix Kernels._ arXiv:2602.11843, 2026 {% cite sao2026neumann %}.
- P. Sao. _What Trace Powers Reveal About Log-Determinants: Closed-Form Estimators, Certificates, and Failure Modes._ arXiv:2601.12612, 2026 {% cite sao2026tracepowers %}.
- J. Bellavita, P. Sao, R. Kannan. _Forward Error Bounds and Efficient Algorithms for Computing a Tensor Times Matrix Chain in Low Precision on GPUs._ SC25 Poster, 2025 {% cite bellavita2025forward %}.

## Connection to Other Projects

These numerical methods feed directly into:

- **SuperLU_DIST**: Iterative refinement and preconditioning
- **Sparsitute**: Sparse linear algebra theory pillar
- **Knowledge Graphs**: Efficient matrix function computation for graph metrics
