---
layout: post
title: "Cross-Entropy Is a Polynomial in a Trench Coat"
subtitle: "Softmax training, log-determinants, and the complex zeros hiding in a positive polynomial."
topic_line: "Machine learning × Optimization × Linear algebra"
date: 2026-09-16 12:00:00
description: "How polynomial capacity connects softmax training, trace-power log-determinant estimation, and the complex zeros that limit Taylor series."
tags: machine-learning softmax cross-entropy polynomials posynomials log-sum-exp curvature optimization probability linear-algebra polynomial-capacity log-determinants complex-zeros information-theory
categories: research
related_posts: false
_styles: |
  .medium-zoom-overlay { z-index: 1050; }
  .medium-zoom-image--opened { z-index: 1051; }
---

_It also moonlights as a partition function, a cumulant generator, and a tool for understanding log-determinants. Its complex zeros are where the cover starts to slip._

A classifier produces a score, or **logit**, for each possible answer: cat, dog, or toaster. [Softmax][wiki-softmax] turns those scores into probabilities:

$$
p_j=\frac{e^{z_j}}{\sum_k e^{z_k}}.
$$

The [cross-entropy][wiki-cross-entropy] loss asks how much probability went to the correct answer $y$, then takes the negative logarithm:

$$
\mathrm{CE}
=
-\log p_y
=
\log\left(\sum_j e^{z_j}\right)-z_y.
$$

A log of a pile of exponentials, minus the score you wanted to win.

The same sum appears in two recent preprints: [**Ghosts of Softmax**][6], which locates complex zeros that limit a local Taylor expansion of cross-entropy, and [**What Trace Powers Reveal About Log-Determinants**][4], which estimates a log-determinant from traces of matrix powers. The connection runs through a familiar object: a polynomial with positive coefficients.

What does that connection buy us? It explains which label averages a softmax model can match, why some optima require parameters to diverge, and how the same complex-zero calculation appears in both papers.

The disguise is a change of coordinates. **When the logits are linear functions of the trainable parameters plus constants, cross-entropy becomes the logarithm of a ratio built from a generalized positive polynomial.** We will build that identity from one small example, following classical connections through probability and entropy to the two preprints.

## 1. A polynomial leaves school

Consider

$$
P(x)=3+5x+2x^2.
$$

At school, you might factor it, differentiate it, or find its roots. For our purposes, read it as a weighted list: **the coefficients are weights, and the exponents describe the things being weighted**.

Here, exponent $0$ gets weight $3$, exponent $1$ gets weight $5$, and exponent $2$ gets weight $2$.

In several variables, the same idea becomes

$$
P(x)=\sum_j c_jx^{a_j},
\qquad
x^{a_j}:=\prod_{\ell=1}^d x_\ell^{a_{j\ell}}.
$$

For an ordinary polynomial, the exponent vectors $a_j$ have nonnegative integer coordinates. We will keep the coefficients positive, omitting any zero terms.

The weighted-list interpretation survives beyond whole-number exponents. If we allow arbitrary real $a_{j\ell}$, while keeping $c_j>0$ and $x_\ell>0$, the expression is called a [**posynomial**][wiki-posynomial].

For example,

$$
3+5x^{-1/2}+2x^{1.7}
$$

is not an ordinary polynomial, but it is a posynomial.

Real exponents let these functions describe square roots, inverse powers, and empirically fitted relationships. Posynomials appear in [geometric programming][wiki-geometric-programming], including circuit models that balance delay, area, and power. [Boyd and colleagues’ tutorial][8] develops this connection.

The name sounds like a polynomial with a positive attitude. The useful requirement is positivity: the terms cannot cancel when all variables are positive. That makes the next operation possible everywhere in that domain: taking a logarithm.

## 2. The change of variables that changes the neighborhood

To expose the logarithmic structure, write

$$
x_\ell=e^{\theta_\ell}.
$$

Then every monomial becomes an exponential:

$$
c_jx^{a_j}
=
c_je^{\langle a_j,\theta\rangle}
=
e^{\langle a_j,\theta\rangle+\log c_j}.
$$

Our polynomial—or posynomial—has become

$$
Z(\theta)
=
P(e^\theta)
=
\sum_j c_je^{\langle a_j,\theta\rangle}.
$$

For the running example,

$$
Z(\theta)=3+5e^\theta+2e^{2\theta}.
$$

This is an exact change of coordinates.

Now take a logarithm:

$$
A(\theta)=\log Z(\theta).
$$

This is a [log-sum-exp][wiki-log-sum-exp] of affine functions. In geometric programming, the corresponding logarithmic transformation converts the standard posynomial objective and inequality constraints into convex functions. [The geometric-programming tutorial][8] explains the required form of the problem.

In statistics, $Z$ is a [**partition function**][wiki-partition-function], and $A$ is a **log-partition function**. The partition function is the sum that normalizes the weights into probabilities. [Wainwright and Jordan][1] develop this exponential-family viewpoint.

The vocabulary changes with the application. The machinery does not:

$$
\boxed{
\text{positive-coefficient polynomial}
\;\longrightarrow\;
\text{posynomial}
\;\xrightarrow{x=e^\theta}\;
\text{positive sum of exponentials}.
}
$$

The first arrow relaxes the exponents. The second changes coordinates.

To see what that normalization gives us, return to the running polynomial.

## 3. A generating function gets a probability distribution

Our running polynomial has total coefficient weight

$$
P(1)=3+5+2=10.
$$

Divide by ten:

$$
G(x)=\frac{P(x)}{10}
=
0.3+0.5x+0.2x^2.
$$

Now imagine a random variable $T$ that equals $0,1,2$ with probabilities $0.3,0.5,0.2$. Then, directly from the definition of expectation,

$$
G(x)=\mathbb E[x^T].
$$

This is its [**probability-generating function**][wiki-pgf]. The coefficient of $x^k$ is the probability that $T=k$.

Substitute $x=e^s$:

$$
M(s)=G(e^s)
=
\mathbb E[e^{sT}].
$$

That is the [**moment-generating function**][wiki-mgf]. Its name is unusually honest. Differentiate $r$ times and evaluate at zero:

$$
M^{(r)}(0)=\mathbb E[T^r].
$$

Differentiating after the substitution brings down powers of the exponents, producing moments.

Finally, take the logarithm:

$$
K(s)=\log M(s).
$$

This is the [**cumulant-generating function**][wiki-cumulant]. Its first derivative gives the mean, its second gives the variance, and its higher derivatives give higher cumulants. For our toy distribution,

$$
K'(0)=0.9,
\qquad
K''(0)=0.49.
$$

Why introduce cumulants when moments already exist? One reason is that cumulants **add for independent sums**. Moment-generating functions multiply; taking the logarithm turns that multiplication into addition. Our polynomial contains a small demonstration of that additivity.

$$
G(x)
=
\frac{1+x}{2}\,
\frac{3+2x}{5}.
$$

The first factor describes a Bernoulli random variable with success probability $1/2$; the second describes one with success probability $2/5$. Multiplying them describes their independent sum.

An algebraist sees factorization. A probabilist sees two independent coin flips. Both readings will survive the move to softmax.

### Softmax is exponential tilting

To recover softmax, allow the exponents to be real vectors again.

Let $C=\sum_jc_j$, and let a random vector $T$ take value $a_j$ with probability $c_j/C$. Then

$$
\frac{Z(\theta)}{Z(0)}
=
\mathbb E[e^{\langle\theta,T\rangle}].
$$

Now change the distribution by reweighting each outcome:

$$
\pi_j(\theta)
=
\frac{c_je^{\langle a_j,\theta\rangle}}
{\sum_kc_ke^{\langle a_k,\theta\rangle}}.
$$

This is called [**exponential tilting**][wiki-exponential-tilting]. Increasing $\theta$ in a direction raises the odds of outcomes with larger projections relative to those with smaller projections.

It is also softmax, with logits

$$
z_j(\theta)=\langle a_j,\theta\rangle+\log c_j.
$$

Differentiate the log-partition function:

$$
\nabla A(\theta)=\mathbb E_{\pi_\theta}[T],
\qquad
\nabla^2 A(\theta)=\operatorname{Cov}_{\pi_\theta}(T).
$$

The [Hessian][wiki-hessian] is a covariance matrix, so it is positive semidefinite: this is why the log-partition function is convex. See [Wainwright and Jordan][1] for the general identities.

**The gradient is an average exponent. The curvature is how much the exponents fluctuate.**

We can now ask a training question: how should we choose the tilt so that this average exponent matches a target?

## 4. Capacity: how small can the whole pile get?

For a target exponent $\alpha$, consider the ratio between the polynomial and the target monomial:

$$
\operatorname{cap}_{\alpha}(P)
=
\inf_{x>0}\frac{P(x)}{x^\alpha}.
$$

The infimum is called **polynomial capacity**, an optimization quantity used in [Gurvits’ work on permanent inequalities][2]. Here, “capacity” names this ratio optimization; it does not measure a model’s expressive power. The same definition applies to our posynomials.

Think of the denominator as a benchmark monomial. Capacity asks how small the entire polynomial can become relative to that benchmark.

For $P(x)=3+5x+2x^2$, three targets give three different outcomes:

| Target     | Ratio being minimized | What happens                                                    |
| ---------- | --------------------- | --------------------------------------------------------------- |
| $\alpha=1$ | $3/x+5+2x$            | A minimum occurs at $x=\sqrt{3/2}$, with value $5+2\sqrt6$.     |
| $\alpha=2$ | $3/x^2+5/x+2$         | The ratio approaches $2$ as $x\to\infty$, but never reaches it. |
| $\alpha=3$ | $3/x^3+5/x^2+2/x$     | The ratio approaches zero.                                      |

Now apply our change of variables:

$$
\log\operatorname{cap}_\alpha(P)
=
\inf_\theta
\left[
A(\theta)-\langle\alpha,\theta\rangle
\right].
$$

The objective on the right is already most of a cross-entropy loss.

For a probability vector of target labels $q=(q_j)$, define

$$
\alpha=\sum_jq_ja_j.
$$

Then

$$
\begin{aligned}
\mathrm{CE}(q,\pi_\theta)
&=-\sum_jq_j\log\pi_j(\theta)\\
&=A(\theta)-\langle\alpha,\theta\rangle
-\sum_jq_j\log c_j.
\end{aligned}
$$

Therefore,

$$
\boxed{
\log\operatorname{cap}_\alpha(P)
=
\inf_\theta\mathrm{CE}(q,\pi_\theta)
+
\sum_jq_j\log c_j.
}
$$

For a hard label, $q$ puts all its mass on one class. For a soft label, $\alpha$ is an average of exponent vectors.

This is the trench coat: **minimizing the capacity objective is equivalent to minimizing cross-entropy for the corresponding fixed log-linear family, up to a known constant**. A trainable final layer over frozen features has this affine-logit form; training all layers of a nonlinear network generally does not.

When the optimum occurs at finite parameters, it has a direct interpretation. Differentiating the capacity objective gives

$$
\nabla A(\theta)-\alpha
=
\mathbb E_{\pi_\theta}[T]-\alpha.
$$

At the optimum, the tilted distribution has the target mean.

Training this softmax family is a moment-matching problem. Whether a finite tilt can match the target is a question about the geometry of the exponents.

## 5. The geometry of training that never finishes

Which target means can we match?

All the possible averages of the exponent vectors form their [convex hull][wiki-convex-hull]:

$$
\mathcal N(P)=\operatorname{conv}\{a_j\}.
$$

For an ordinary polynomial, this is its [**Newton polytope**][wiki-newton-polytope].

Capacity is positive exactly when $\alpha$ lies in this convex hull. A finite minimizer exists exactly when $\alpha$ lies in its [**relative interior**][wiki-relative-interior]: the interior measured within the affine space occupied by the polytope. This is the mean-parameter geometry of finite exponential families, discussed by [Wainwright and Jordan][1].

The reason is visible in the probabilities. At every finite $\theta$, every term has positive probability. To put the mean on a proper boundary face, all probability outside that face must disappear. Exponential tilting can make it arbitrarily small, but cannot make it exactly zero at finite parameters.

A boundary target explains why the best loss can be approached indefinitely without a finite minimizer.

For our polynomial, the convex hull is $[0,2]$. Mean $1$ is attainable at a finite tilt. Mean $2$ requires all probability to concentrate on the largest exponent. Mean $3$ is impossible.

{% include figure.liquid
  path="assets/img/cross-entropy/capacity-geometry.png"
  class="img-fluid rounded"
  width="1448"
  height="1086"
  alt="Capacity geometry for P(x)=3+5x+2x squared: target mean 1 lies inside the exponent interval and has a finite optimum; mean 2 lies on its boundary and requires an infinite limiting tilt; mean 3 is outside the interval and has zero capacity."
  caption="The three targets from the capacity example, viewed as points relative to the exponent interval. A finite tilt matches an interior mean; boundary means require a limit. Click the image to enlarge."
  zoomable=true
  loading="lazy"
%}

Notice a subtlety: even a **hard label** can correspond to an interior exponent. In our three-class toy family, the exponent $1$ lies inside the convex hull $[0,2]$. This hard label has a finite optimum, with a maximum class probability of

$$
\sup_\theta \pi_1(\theta)
=
\frac{5}{5+2\sqrt6}\approx0.505.
$$

The classifier’s shared one-dimensional parameter couples all three logits. Raising the middle logit also changes its rivals. That coupling becomes especially relevant when a dataset shares one parameter vector.

### A whole dataset is still one capacity problem

Suppose example $i$ has affine logits

$$
z_{ij}(\theta)=b_{ij}+\langle a_{ij},\theta\rangle,
$$

with the same parameter vector $\theta$ shared across examples. For target probabilities $q_{ij}$, let $\alpha_i=\sum_jq_{ij}a_{ij}$. Associate the posynomial

$$
P_i(x)=\sum_j e^{b_{ij}}x^{a_{ij}}.
$$

Summing cross-entropies adds log-partition functions. Adding logarithms multiplies their arguments:

$$
\sum_i
\left[
\log P_i(e^\theta)-\langle\alpha_i,\theta\rangle
\right]
=
\log
\frac{\left(\prod_iP_i\right)(e^\theta)}
{e^{\langle\sum_i\alpha_i,\theta\rangle}}.
$$

Thus the infimum of the summed cross-entropy is

$$
\log\operatorname{cap}_{\sum_i\alpha_i}\!\left(\prod_iP_i\right)
-\sum_{i,j}q_{ij}b_{ij}.
$$

The dataset contributes a product of posynomials and a sum of target exponents.

The exponent polytope of the product is the [Minkowski sum][wiki-minkowski-sum] of the individual polytopes: take one point from each and add them.

For hard labels, a target on the relative boundary means there is a direction that never worsens any correct-label margin and strictly improves at least one. This includes **quasi-separation**, where some margins remain unchanged; strict separation improves every comparison.

The max-margin behavior of gradient descent on separable logistic regression requires an additional result about the optimizer, such as [Soudry and colleagues’ theorem][3]. Capacity gives the geometry of the objective. To interpret its optimal value, we turn to entropy.

## 6. Capacity has an information-theoretic secret

The capacity value also has a description in terms of distributions. For $\alpha$ in the convex hull of the exponents, convex duality gives

$$
\log\operatorname{cap}_\alpha(P)
=
\max_{\substack{\nu_j\ge0,\;\sum_j\nu_j=1\\
\sum_j\nu_ja_j=\alpha}}
\left[
H(\nu)+\sum_j\nu_j\log c_j
\right],
$$

where $H(\nu)=-\sum_j\nu_j\log\nu_j$.

The constraint fixes the mean at $\alpha$; the objective rewards entropy and coefficient weight. This is the maximum-entropy viewpoint developed in [Straszak and Vishnoi’s work][9].

When all coefficients equal one, it really is maximum entropy. For unequal coefficients, it is more naturally a problem of minimizing [relative entropy][wiki-relative-entropy].

Let $r_j=c_j/C$, where $C=\sum_jc_j$, and write $D_{\mathrm{KL}}(\nu\Vert r)=\sum_j\nu_j\log(\nu_j/r_j)$ for relative entropy. Rearranging gives

$$
\boxed{
\log\operatorname{cap}_\alpha(P)
=
\log C
-
\min_{\mathbb E_\nu[T]=\alpha}
D_{\mathrm{KL}}(\nu\Vert r).
}
$$

Capacity is the total coefficient mass, discounted by the least information-theoretic cost of forcing the mean to $\alpha$.

That interpretation also leads to a direct probability bound.

For an ordinary polynomial, take the normalized probability-generating function $G=P/C$, and let $T_1,\ldots,T_N$ be independent draws from its distribution. Because generating functions multiply, the probability of a particular sum is a coefficient of $G(x)^N$. Nonnegative coefficients imply

$$
\Pr(T_1+\cdots+T_N=N\alpha)
\le
\inf_{x>0}\frac{G(x)^N}{x^{N\alpha}}
=
\operatorname{cap}_\alpha(G)^N,
$$

whenever that lattice target is meaningful.

For a target mean different from the original mean, this gives an upper bound that decays exponentially with $N$. Capacity is pricing a rare event, using the fact that one coefficient cannot exceed the whole positive sum.

### Why Gurvits cared about coefficients

For any nonnegative-coefficient polynomial,

$$
[x^\alpha]P\le\operatorname{cap}_\alpha(P),
$$

because the single term $[x^\alpha]P\,x^\alpha$ cannot exceed the whole sum.

For polynomials with additional structure, [Gurvits’ theory][2] also bounds coefficients from below in terms of capacity.

Take a nonnegative $n\times n$ matrix $B$, and form

$$
P_B(x)=\prod_{i=1}^n\left(\sum_{j=1}^nB_{ij}x_j\right).
$$

Expanding the product chooses one column from each row. The [permanent][wiki-permanent] sums the weights of choices that use every column exactly once; it is the coefficient of $x_1\cdots x_n$:

$$
[x_1\cdots x_n]P_B=\operatorname{per}(B).
$$

If $B$ is [doubly stochastic][wiki-doubly-stochastic], weighted AM–GM shows that $P_B(x)\ge x_1\cdots x_n$, with equality at $x=\mathbf1$. Its capacity at $\mathbf1$ is therefore one.

Gurvits’ coefficient inequality then yields

$$
\operatorname{per}(B)\ge\frac{n!}{n^n},
$$

the van der Waerden bound. The structure supporting this inequality is **real stability**, which restricts where a polynomial can have complex zeros.

Applying such a coefficient theorem to a classifier would require checking its polynomial assumptions separately. For the two preprints, we will ask a different question about complex zeros: how close can they come to the point where we expand a logarithm? First, we need the exponential sum associated with a matrix.

## 7. A matrix spectrum joins the party

The matrix version starts with a symmetric [positive definite matrix][wiki-positive-definite] $B$, with eigenvalues $\lambda_1,\ldots,\lambda_n>0$.

Its log-determinant is

$$
\log\det B=\sum_i\log\lambda_i.
$$

Its trace powers are

$$
p_k=\operatorname{tr}(B^k)=\sum_i\lambda_i^k.
$$

[**What Trace Powers Reveal About Log-Determinants**][4] asks how much a few trace powers tell us about the log-determinant. The difficulty is that these quantities attend to different parts of the spectrum.

For example, for

$$
B_\varepsilon=\operatorname{diag}(\varepsilon,1,\ldots,1),
$$

we have

$$
\operatorname{tr}(B_\varepsilon^k)=n-1+\varepsilon^k,
\qquad
\log\det B_\varepsilon=\log\varepsilon.
$$

As $\varepsilon\to0$, its contribution to every positive trace power disappears, while its contribution to the log-determinant becomes arbitrarily negative.

Large positive powers listen to the biggest eigenvalues. The log-determinant also needs to hear the quietest one.

To connect the two quantities, let $\mu=\operatorname{tr}(B)/n$, and choose a normalized eigenvalue $X=\lambda_i/\mu$ uniformly at random. Define

$$
M(t)=\mathbb E[X^t]
=
\frac1n\sum_i
e^{t\log(\lambda_i/\mu)}.
$$

There it is again: a positive sum of exponentials.

**This is the moment-generating function of $Y=\log X$.** Its positive integer values are moments of $X$; its derivatives at zero are moments of $\log X$. That distinction lets one function connect trace powers to the log-determinant.

With $K(t)=\log M(t)$,

$$
K'(0)=\frac1n\sum_i\log(\lambda_i/\mu),
$$

so

$$
\boxed{
\log\det B=n\bigl(\log\mu+K'(0)\bigr).
}
$$

Trace powers give us values of this curve; the log-determinant asks for its slope at zero. The normalization supplies two anchors, $K(0)=K(1)=0$, and each positive trace power gives

$$
K(k)=\log\frac{p_k}{n\mu^k}.
$$

The preprint constructs estimators by interpolating these values and differentiating the interpolating polynomial at zero. It also develops bounds; lower certificates use additional spectral information, such as a positive lower bound on the smallest eigenvalue. [The full paper][5] gives the constructions and their assumptions.

{% include figure.liquid
  path="assets/img/cross-entropy/trace-powers-log-determinants.png"
  class="img-fluid rounded"
  width="1448"
  height="1086"
  alt="A matrix spectrum feeds two calculations: positive trace powers emphasize the largest eigenvalues, while a tiny eigenvalue can drive the log-determinant toward negative infinity. The normalized log-moment curve K(t) is convex, equals zero at t=0 and t=1, and has a nonpositive initial slope."
  caption="Trace powers sample a spectral curve, while the log-determinant depends on its slope at zero. The tiny-eigenvalue example explains why positive moments can miss a contribution that dominates the logarithm. Click the image to enlarge."
  zoomable=true
  loading="lazy"
%}

This brings us back to the logarithm of a positive exponential sum. Its behavior on the real line is smooth. To understand the reach of its Taylor series, we must look off that line.

## 8. The ghosts of the same sum

For a complex argument, exponential terms acquire phases and can cancel. The resulting **complex zeros** limit how far the logarithm’s Taylor series can converge.

For the running polynomial,

$$
P(x)=(1+x)(3+2x).
$$

Its roots are $-1$ and $-3/2$. Under $x=e^\theta$, these become zeros of $P(e^\theta)$ at

$$
\theta=(2m+1)i\pi
$$

and

$$
\theta=\log(3/2)+(2m+1)i\pi,
\qquad m\in\mathbb Z.
$$

Dividing by $P(1)$ gives the moment-generating function and leaves these zeros unchanged. The logarithm is singular there, and the nearest zeros to the origin are $\pm i\pi$. The cumulant-generating function’s Taylor series therefore has [radius of convergence][wiki-radius] $\pi$.

The function behaves smoothly everywhere on the real line. Its local power series nevertheless has a finite reach.

The same mechanism appears in [**Ghosts of Softmax**][6]. For affine logits along an update direction,

$$
z_j(t)=z_j(0)+a_jt,
$$

the partition function is another exponential sum. Its complex zeros determine the Taylor radius of the log-partition term. The preprint derives an exact binary formula and a multiclass lower bound for this affine-logit model.

To see the connection between the papers explicitly, consider the two-term sum

$$
F(t)=u e^{at}+v e^{bt},
\qquad u,v>0,\quad a\ne b.
$$

Its zeros satisfy

$$
e^{(b-a)t}=-\frac uv,
$$

hence

$$
t_m=
\frac{\log(u/v)+(2m+1)i\pi}{b-a}.
$$

The nearest zero has distance

$$
\boxed{
R=
\frac{\sqrt{\log^2(u/v)+\pi^2}}{|b-a|}.
}
$$

For **binary softmax**, $u,v$ are exponentiated initial logits, and $\lvert b-a\rvert$ is the spread of directional logit derivatives.

For a **two-point spectrum**, $u,v$ are the spectral masses, and

$$
|b-a|=\log(\lambda_{\max}/\lambda_{\min}).
$$

The [binary-softmax formula][6] and the [two-point spectral formula][5] are the same zero calculation, with different meanings assigned to the weights and exponents.

{% include figure.liquid
  path="assets/img/cross-entropy/complex-zeros-softmax.png"
  class="img-fluid rounded"
  width="1448"
  height="1086"
  alt="A sum of two positive exponentials stays positive on the real line but has complex zeros on a vertical lattice. The distance from the origin to the nearest zero is the Taylor radius of log F; the same calculation applies to binary softmax and a two-point spectral sum."
  caption="The exponential sum has no real zeros, yet its complex zeros bound the Taylor expansion of its logarithm. In the sigmoid example, zeros of the denominator are poles of the sigmoid. The circle depicts a Taylor convergence radius. Click the image to enlarge."
  zoomable=true
  loading="lazy"
%}

With more than two softmax terms and a nonzero exponent spread, the affine-logit model gives

$$
R\ge\frac{\pi}{\max_j a_j-\min_j a_j}.
$$

Before the phases spread across a half-circle, positive weighted vectors cannot cancel. If all slopes are equal, the sum is a single exponential times a positive constant, and the radius is infinite. [Ghosts of Softmax][6] gives the phase argument.

The radius describes convergence of the full Taylor series. Using it to guarantee a decrease in loss requires additional analysis. For example,

$$
\ell(t)=\log(1+e^{-t})
$$

decreases for every real $t>0$, including beyond its Taylor radius $\pi$. A finite Taylor approximation also needs an error bound, even inside that radius. For the spectral problem, polynomial interpolation has its own error analysis.

Complex zeros give the two problems a shared analytic structure. The spectral curve has one more connection to reveal: its minimum takes us back to capacity.

## 9. One last costume change: the spectrum comes back to capacity

We can derive that connection directly from the identities above. The following calculation extends the discussion in this post; it is not presented here as a new theorem from either preprint.

Turn the eigenvalues into a probability vector:

$$
r_i=\frac{\lambda_i}{\sum_j\lambda_j},
\qquad
u_i=\frac1n.
$$

A direct calculation gives

$$
D_{\mathrm{KL}}(u\Vert r)
=
\log\mu-\frac1n\log\det B.
$$

Equivalently,

$$
\boxed{
\log\det B
=
n\log\mu-nD_{\mathrm{KL}}(u\Vert r).
}
$$

At fixed trace, the log-determinant deficit from the equal-eigenvalue case is exactly a relative entropy.

A tiny eigenvalue means a tiny $r_i$. The uniform distribution still insists on assigning that coordinate weight $1/n$, so the divergence notices what positive powers almost ignore.

The same probability vectors also express the entire spectral generating function:

$$
M(t)
=
\frac1n\sum_i(\lambda_i/\mu)^t
=
\sum_i u_i^{\,1-t}r_i^{\,t}.
$$

Minimizing this expression over $0\le t\le1$, then taking its negative logarithm, gives the **Chernoff information** between $u$ and $r$. This measures their distinguishability in binary hypothesis testing; [Nielsen’s review][7] develops the connection.

Now define the posynomial

$$
Q(x)=\frac1n\sum_i x^{\log(\lambda_i/\mu)}.
$$

Since $Q(e^t)=M(t)$,

$$
\operatorname{cap}_0(Q)=\inf_{t\in\mathbb R}M(t).
$$

Convexity of $\log M(t)$, together with $M(0)=M(1)=1$, ensures that a global minimum can be found in $[0,1]$. Therefore,

$$
\boxed{
\operatorname{cap}_0(Q)
=
e^{-C(u,r)},
}
$$

where $C(u,r)$ is Chernoff information.

So this one spectral curve has several interpretations.

The positive integer values of $M$ encode trace powers. The slope of $K=\log M$ at zero gives the normalized log-determinant. The minimum of $M$ is a posynomial capacity and a hypothesis-testing quantity. The complex zeros of $M$ control the Taylor radius of $K$.

We left polynomial capacity to talk about matrices.

Capacity was already waiting inside the matrix.

## What the shared formula gives us

The common object is small:

$$
Z(\theta)=\sum_j c_je^{\langle a_j,\theta\rangle}.
$$

Change coordinates, and it is a polynomial or posynomial. Normalize it, and it generates a probability distribution. Differentiate its logarithm, and it gives means, covariances, and higher cumulants. Minimize its logarithm after subtracting a target linear term, and it gives log-capacity. That objective also gives the best cross-entropy in the corresponding log-linear family, up to the coefficient constant.

For affine logits, these identities turn a training objective into a problem about exponent geometry and entropy. For a matrix spectrum, the same exponential sum connects available moments to a desired derivative. In both settings, complex zeros reveal a limit on local Taylor expansions.

**Exponent geometry tells us which means are attainable. Entropy tells us what it costs to attain them. Complex-zero geometry tells us how far a local series can see.**

The two preprints follow different parts of this map:

- [**Ghosts of Softmax: Complex Singularities That Limit Safe Step Sizes in Cross-Entropy**][6] develops the zero geometry for the affine-logit model.
- [**What Trace Powers Reveal About Log-Determinants: Closed-Form Estimators, Certificates, and Failure Modes**][4] develops estimators and bounds from trace information.

The polynomial did not become something else. We kept asking it different questions.

---

[1]: https://people.eecs.berkeley.edu/~jordan/papers/wainwright-jordan-fnt.pdf "Wainwright and Jordan: Graphical Models, Exponential Families, and Variational Inference"
[2]: https://arxiv.org/abs/math/0510452 "Gurvits: Hyperbolic Polynomials Approach to Van der Waerden/Schrijver-Valiant like Conjectures"
[3]: https://jmlr.org/papers/v19/18-188.html "Soudry et al.: The Implicit Bias of Gradient Descent on Separable Data"
[4]: https://arxiv.org/abs/2601.12612 "What Trace Powers Reveal About Log-Determinants"
[5]: https://arxiv.org/html/2601.12612v1 "What Trace Powers Reveal About Log-Determinants, version 1"
[6]: https://arxiv.org/html/2603.13552v1 "Ghosts of Softmax, version 1"
[7]: https://arxiv.org/html/2207.03745v3 "Nielsen: Revisiting Chernoff Information with Likelihood Ratio Exponential Families"
[8]: https://web.stanford.edu/~boyd/papers/gp_tutorial.html "Boyd et al.: A Tutorial on Geometric Programming"
[9]: https://proceedings.mlr.press/v99/straszak19a.html "Straszak and Vishnoi: Maximum Entropy Distributions: Bit Complexity and Stability"
[wiki-softmax]: https://en.wikipedia.org/wiki/Softmax_function
[wiki-cross-entropy]: https://en.wikipedia.org/wiki/Cross-entropy
[wiki-posynomial]: https://en.wikipedia.org/wiki/Posynomial
[wiki-geometric-programming]: https://en.wikipedia.org/wiki/Geometric_programming
[wiki-log-sum-exp]: https://en.wikipedia.org/wiki/LogSumExp
[wiki-partition-function]: https://en.wikipedia.org/wiki/Partition_function_(mathematics)
[wiki-pgf]: https://en.wikipedia.org/wiki/Probability-generating_function
[wiki-mgf]: https://en.wikipedia.org/wiki/Moment-generating_function
[wiki-cumulant]: https://en.wikipedia.org/wiki/Cumulant
[wiki-exponential-tilting]: https://en.wikipedia.org/wiki/Exponential_tilting
[wiki-hessian]: https://en.wikipedia.org/wiki/Hessian_matrix
[wiki-convex-hull]: https://en.wikipedia.org/wiki/Convex_hull
[wiki-newton-polytope]: https://en.wikipedia.org/wiki/Newton_polytope
[wiki-relative-interior]: https://en.wikipedia.org/wiki/Relative_interior
[wiki-minkowski-sum]: https://en.wikipedia.org/wiki/Minkowski_sum
[wiki-relative-entropy]: https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence
[wiki-permanent]: https://en.wikipedia.org/wiki/Permanent_(mathematics)
[wiki-doubly-stochastic]: https://en.wikipedia.org/wiki/Doubly_stochastic_matrix
[wiki-positive-definite]: https://en.wikipedia.org/wiki/Positive-definite_matrix
[wiki-radius]: https://en.wikipedia.org/wiki/Radius_of_convergence
