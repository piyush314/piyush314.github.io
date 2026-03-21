---
layout: post
title: "How Many Matrix Multiplications Do You Actually Need?"
date: 2026-03-21 12:00:00
description: "Faster Neumann series evaluation through smarter radix kernels - achieving ~25% fewer matrix products at the same accuracy."
tags: numerical-methods linear-algebra high-performance-computing matrix-computation preconditioning
categories: research
---

## How Many Matrix Multiplications Do You Actually Need?

### Faster Neumann series evaluation through smarter radix kernels

---

When you need an approximate matrix inverse — for preconditioning,
log-determinant estimation, or MIMO signal detection — you often
use the truncated Neumann series:

$$S_k(A) = I + A + A^2 + \cdots + A^{k-1}$$

When the spectral radius of $A$ is less than 1, this converges to
$(I - A)^{-1}$. Simple enough in theory. Practically, the cost is
dominated by matrix-matrix products (GEMMs), and this raises the
question: *how many multiplications do you actually need to get
$k$ terms?*

The naive answer is $k - 1$ products — just keep multiplying. In
our recent preprint, we show the real answer is significantly fewer,
and this reveals a clean structure underneath.

## Starting from scratch: the naive approach

Let's build intuition from the ground up. Suppose you want $S_8(A)
= I + A + A^2 + \cdots + A^7$. The brute-force way computes each
power in sequence: multiply $A$ by itself to get $A^2$, multiply
$A^2$ by $A$ to get $A^3$, and so on. That's 7 matrix
multiplications for 8 terms. In general, $k - 1$ products for $k$
terms.

When $k$ is in the thousands — common in preconditioning or MIMO —
this is expensive. A polynomial preconditioner with $k = 10{,}000$
terms would require 9,999 dense matrix multiplications. Each one
is an $O(n^3)$ operation. Even on a GPU, this cost makes you
reconsider whether you wanted an approximate inverse.

So the question sharpens: can we get those $k$ terms with far
fewer than $k - 1$ products? The answer is yes, and the first
insight is one you've probably seen before in a different context.

## The binary trick: doubling your money

Here's the core observation. Suppose you've already computed
$S_4(A) = I + A + A^2 + A^3$. Can you get $S_8(A)$ cheaply?

Factor it:

$$S_8(A) = (I + A + A^2 + A^3) + A^4(I + A + A^2 + A^3) = S_4(A)
\cdot (I + A^4)$$

This second step costs just two multiplications: one to compute
$A^4$ (by squaring $A^2$, which you already have), and one for the
final product $S_4 \cdot (I + A^4)$. You've doubled the length of
your series with 2 products.

Now apply this recursively. Start with $S_1 = I$ (free). Double to
$S_2$ (2 products). Double to $S_4$ (2 more). Double to $S_8$ (2
more). To reach $S_k$, you need $\lceil\log_2 k\rceil$ doubling
steps, each costing 2 products. Total: $2\log_2 k$ products, a
massive improvement over $k - 1$.

For $k = 1024$, that's about 20 products instead of 1023. The
savings are enormous — but can we squeeze out more?

## The ternary trick: tripling instead of doubling

The binary approach doubles the series each step. What if we
*tripled* it?

Suppose you have $S_3(A) = I + A + A^2$. You want to triple the
series length to get $S_9(A)$. The same factoring idea works:

$$S_9(A) = S_3(A) \cdot (I + A^3 + A^6)$$

The second factor — call it $T_3(A^3) = I + A^3 + A^6$ — is itself
a 3-term Neumann series in the variable $A^3$. To compute it, you
need $A^3$ (1 product: $A^2 \cdot A$), then $A^6 = (A^3)^2$ (1
product), then the sum $I + A^3 + A^6$ (free, just addition), and
finally the outer product $S_3 \cdot T_3$ (1 product). That's 3
products to triple the series.

Each ternary step grows the series by a factor of 3 using 3
products. After $t$ steps, you've reached $k = 3^t$ terms. The
total cost is $3\log_3 k$, which works out to about $1.89\log_2 k$
products. That's a roughly 5% improvement over binary's $2\log_2
k$.

A 5% improvement isn't earth-shattering on its own. But it reveals
the real question hiding underneath: **the cost per step and the
growth factor per step are in tension.** Doubling is cheap (2
products) but only doubles. Tripling costs more (3 products) but
triples. Which tradeoff wins? And what happens if you quadruple,
or quintuple, or go even higher? The answer depends entirely on
how cheaply you can build the kernel for each radix — and that's
where this story gets interesting.

## Seeing the pattern: radix kernels

We now have two data points — binary costs 2 products per step
with factor-2 growth, ternary costs 3 products per step with
factor-3 growth — and one burning question: what's the optimal
tradeoff? To compare radices fairly, we need a single metric that
captures both the cost and the payoff of each step.

Notice what binary and ternary splitting have in common. In both
cases, we're computing a *kernel* — a small Neumann series that,
when composed with what we already have, extends the full series
by a multiplicative factor.

For binary, the kernel is $T_2(B) = I + B$. It costs 0 products to
evaluate (it's just a sum), and it doubles the series. But you
also need to compute $B = A^n$ (1 product for squaring) and the
outer product $S_n \cdot T_2$ (1 product). Total per step: 0 + 1 +
1 = 2 products for a factor-of-2 growth.

For ternary, the kernel is $T_3(B) = I + B + B^2$. It costs 1
product to evaluate (you need $B^2$), plus 1 for computing $B =
A^n$ and 1 for the outer product. Total per step: 1 + 1 + 1 = 3
products for a factor-of-3 growth.

With this decomposition, we can write down a single efficiency
metric that applies to any radix: the cost-per-step divided by the
information-per-step, both measured in the same base:

$$\text{efficiency} = \frac{\text{products per
step}}{\log_2(\text{growth per step})}$$

For binary, that's $2/\log_2 2 = 2.00$. For ternary, $3/\log_2 3
\approx 1.89$. Ternary wins because tripling is worth more than
doubling, and it only costs one extra product.

What about radix 4? You'd need $T_4(B) = I + B + B^2 + B^3$, which
takes 2 products to evaluate naively (compute $B^2$, then $B^3 =
B^2 \cdot B$). Add the squaring and outer product and you get 4
products per step with growth factor 4. Efficiency: $4/\log_2 4 =
2.00$ — no better than binary. Radix 4 doesn't help because the
kernel is too expensive relative to how much it grows the series.

So the game is clear: **you want the highest radix whose kernel
you can evaluate cheaply enough to beat the lower-radix
alternatives.** If you could find clever constructions — tricks
that compute $T_m$ in fewer products than the naive $m - 2$ —
you'd push the efficiency frontier. So where does that frontier
lie? Before our work, only one such construction was known.

## The quinary kernel: prior state of the art

Before this paper, the highest radix anyone had an explicit kernel
for was 5. The naive way to compute $T_5(B) = I + B + B^2 + B^3 +
B^4$ would require 3 products ($B^2$, $B^3$, $B^4$), giving
efficiency $5/\log_2 5 \approx 2.15$ — worse than binary. So
quinary only helps if you can beat the naive product count.
Gustafsson et al. (2017) showed you can, with just 2 products:

1. Compute $U = B^2$ (1 product)
2. Compute $V = U(B + U) = B^3 + B^4$ (1 product)
3. Assemble: $T_5(B) = I + B + U + V$ (free — just additions)

That's elegant. With 2 kernel products, 1 for squaring, and 1 for
the outer product, each step costs 4 products and grows the series
by a factor of 5. Efficiency: $4/\log_2 5 \approx 1.72$ — a
significant jump from ternary's 1.89.

But here the trail went cold. Nobody had constructed an explicit
kernel for radix 7, 9, 11, or anything higher. Theoretical
analysis suggested better constants were achievable — the optimal
radix among integers is actually $m = 3$ for *naive* kernel
computation, where $T_m$ itself costs $m - 2$ products. But the
quinary kernel broke that pattern by evaluating $T_5$ in fewer
products than the naive count. Could the same trick work at higher
radices?

## The radix-9 kernel: our first contribution

This brings us to our paper's first result: a radix-9 exact kernel — the first such construction beyond radix 5.

The quinary kernel works because a single cleverly chosen product
($U(B + U)$) generates two terms at once. Can the same strategy
scale? Radix 9 would need $T_9(B) = I + B + \cdots + B^8$ — that's
9 coefficients to nail. The degree-doubling bound (a standard
result relating polynomial degree to multiplication count) says 3
kernel products should suffice, but actually constructing them
means solving a much harder algebraic puzzle: you need a single
matrix product that simultaneously generates four high-degree
terms ($B^5$ through $B^8$) with the right coefficients.

We show it can be done. The construction uses only 3
matrix products and is the first explicit exact kernel beyond
radix 5.

The idea: choose two matrix factors $P$ and $Q$, each a linear
combination of already-computed building blocks ($B$, $B^2$, $B^3
+ 2B^4$), such that their product $P \cdot Q$ generates all the
high-degree terms ($B^5$ through $B^8$) in one shot. The
low-degree terms ($B^2$ through $B^4$) get patched up afterward
using the building blocks directly.

The cleverness is in how $P$ and $Q$ are chosen. The product of
two degree-4 polynomials in $B$ spans degrees 2–8. By carefully
allocating coefficients — treating degrees 5–8 as the primary
targets and allowing degrees 2–4 to be corrected post-hoc — the
construction simultaneously hits all required coefficients. The
result uses only rational arithmetic: every coefficient is a
fraction whose denominator divides 800.

With 3 kernel products, 1 for the power update, and 1 for
concatenation, each step costs 5 products and grows the series by
a factor of 9. Efficiency: $5/\log_2 9 \approx 1.58$ — a 21%
improvement over binary and 8% over quinary.

| Radix | Kernel Products | Total per Step | Efficiency |
|-------|-----------------|----------------|------------|
| 2     | 0               | 2              | 2.00       |
| 3     | 1               | 3              | 1.89       |
| 5     | 2               | 4              | 1.72       |
| 9     | 3               | 5              | 1.58       |
| 15*   | 4               | 6              | 1.54       |
| 24*   | 5               | 7              | 1.53       |

*(\* approximate kernels)*

## Going further: approximate kernels and the spillover problem

Can you keep climbing to even higher radices? For radix 15, the
lower bound says you need at least 4 products for the kernel. If
achievable, that would give efficiency $6/\log_2 15 \approx 1.54$.

We find such a kernel through numerical optimization. But
there's a catch: unlike the radix-5 and radix-9 kernels, which
produce *exactly* $I + B + \cdots + B^{m-1}$ and nothing else, the
radix-15 kernel produces the right terms through degree 14 but
also generates small unwanted higher-degree terms — what we
call *spillover*. With 28 free parameters across 4 chained
products, you can nail the 15 target coefficients, but zeroing out
all spillover simultaneously appears to be impossible.

This isn't just a numerical nuisance. Spillover breaks the
standard technique for extending the series. Normally, you use the
geometric identity $T_m(B)(I - B) = I - B^m$ to cleanly extract
the next power of $A$ and set up the next iteration. When the
kernel produces extra terms, this identity no longer holds
exactly, and the errors could compound across iterations.

So we're stuck with a tantalizing situation: higher-radix kernels
exist and would give better efficiency — but they come with
spillover that seems to invalidate the very framework they'd plug
into. Can approximate kernels be salvaged, or is radix 9 the end
of the road?

## The general framework: making spillover safe

This is the paper's most transferable contribution. The
trick is to stop tracking the series directly and instead track
the *residual* — the gap between your running approximate inverse
and the true inverse.

The key mathematical observation: if you apply an imperfect kernel
to the residual, the spillover doesn't corrupt your answer — it
just gets pushed to higher and higher powers with each iteration.
Because we track the residual, contaminated high-degree terms never
contribute to the prefix of the approximation we actually care about.
After $n$ iterations with a radix-$m$ kernel, the residual's
leading term sits at degree $m^n$, regardless of spillover. The
prefix of your approximation stays exact.

This framework recovers all the earlier methods as special cases.
Binary splitting, ternary splitting, exact telescoping — they all
fall out when you plug in the appropriate (spillover-free) kernel.
But now you can also plug in *approximate* kernels and still get
rigorous convergence guarantees, provided the spectral radius is
within a modestly tightened safe zone.

Within this framework, radix-15 achieves efficiency $\approx
1.54$, and radix-24 (a 5-product approximate kernel) achieves
$\approx 1.53$ — the best known rate. The tightening is real but
manageable: radix-15 requires $\rho(A) < 0.971$ and radix-24
requires $\rho(A) < 0.984$, versus the full $\rho(A) < 1$ for exact
kernels.

## Does it actually work?

Theory is one thing. These kernels involve rational coefficients
with denominators in the hundreds and approximate constructions
with nonzero spillover. Do the product-count savings actually
survive floating-point arithmetic?

We tested everything in Python/NumPy with IEEE 754 doubles —
a realistic setting, not a symbolic algebra sandbox. Product-count
savings are real and match predictions: for $k = 729$, radix-9
uses 15 matrix multiplications where binary uses 20. For $k =
13{,}824$, radix-24 uses 21 where binary uses 28 — about 25%
fewer products in both cases. On 4096×4096 dense matrices, this
translates to roughly 20% wall-clock speedup.

Accuracy-wise, all exact methods (binary, quinary, radix-9) reach
machine-precision residuals for a given series length, confirming
the algebraic identities hold numerically. The approximate kernels
(radix-15, radix-24) also reach machine precision, with prefix
errors below $2 \times 10^{-15}$, thanks to the framework's
error-containment properties.

The stability picture is nuanced. Exact kernels work for any
$\rho(A) < 1$. Approximate kernels tighten the safe zone:
radix-15 requires $\rho(A) < 0.971$, and radix-24 requires
$\rho(A) < 0.984$. The paper provides three increasingly strict
tests (basin test, disk test, coefficient test) for verifying
stability of a given kernel.

The bottom line: ~25% fewer matrix multiplications at the same
accuracy, and the savings translate to wall-clock time on real
hardware. The theory works in practice.

## The bigger picture

What makes this work satisfying beyond the specific results is
the structural insight. There's a clean hierarchy: radix 2
(trivial kernel), radix 5 (2-product exact kernel), radix 9
(3-product exact kernel) — and then a wall. At radix 15 and
beyond, the evidence strongly suggests exact rational kernels
don't exist. You're forced into approximate constructions, and the
spillover isn't a flaw in the search method — it appears to be a
fundamental boundary in algebraic kernel construction.

The general framework bridges this boundary gracefully. And the
open questions it leaves are compelling: Is the exact/approximate
boundary provably at radix 9? Can the efficiency constant continue
improving past 1.53? And most practically — how do these kernel
techniques extend to structured matrices (sparse, Toeplitz), or to
polynomial trace estimation for log-determinants?

For anyone doing matrix series evaluation in production —
preconditioners, resolvent approximations, MIMO detection — the
takeaway is concrete: you can get ~25% fewer matrix
multiplications at the same accuracy by swapping in a better
kernel. The radix-9 kernel is exact and drop-in. The higher-radix
approximate kernels are nearly as accurate and even cheaper.

---

*The paper: [Fast Evaluation of Truncated Neumann Series by
Low-Product Radix Kernels](https://arxiv.org/abs/2602.11843).
Preprint, February 2026.*
