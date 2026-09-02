---
layout: post
title: "New preprint: Ghosts of Softmax"
date: 2026-03-13 15:42:12-0400
inline: false
related_posts: false
---

New preprint available: [**Ghosts of Softmax: Complex Singularities That Limit Safe Step Sizes in Cross-Entropy**](https://arxiv.org/abs/2603.13552).

Cross-entropy training can fail suddenly — loss spikes have been reported in large-scale runs of PaLM, LLaMA, and other models. Practitioners mitigate these with gradient clipping, warmup schedules, and manual restarts. But these treat symptoms, not causes.

We identify a geometric mechanism that existing analyses miss. The softmax partition function has complex zeros — "ghosts" — that cap the Taylor convergence radius of the loss along any update direction. Inside this radius, local models track the true loss and descent guarantees hold. Beyond it, they can diverge, and a single step can collapse accuracy.

#### Key results

- **Closed-form bound**: For binary cross-entropy the exact safe radius is $$\rho^* = \sqrt{\delta^2 + \pi^2} / \Delta_a$$. For multiclass, we derive the tractable lower bound $$\rho_a = \pi / \Delta_a$$, computable with one Jacobian-vector product.
- **Sharp phase transition**: Across six architectures, no model fails for normalized step $$r = \tau/\rho_a < 1$$, yet collapse appears once $$r \ge 1$$.
- **Practical controller**: A simple rule $$\eta = r\,\rho_a / \|v\|$$ from local geometry alone reaches 85.3% on ResNet-18/CIFAR-10 without a hand-designed LR schedule (best fixed rate: 82.6%), and survives learning-rate spikes up to 10,000x where gradient clipping collapses.

This constraint operates through Taylor convergence rather than Hessian curvature, offering an optimizer-agnostic bound that makes the safe step size visible.
