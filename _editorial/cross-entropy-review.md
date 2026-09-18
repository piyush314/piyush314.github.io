# Editorial review: Cross-Entropy Is a Polynomial in a Trench Coat

The revised post preserves the nine-part mathematical tour, running polynomial, equations, and playful voice. Its main change is a clearer purpose: both preprints appear in the opening, and each section prepares the next question.

## Reader model and scope

- **Genre:** an explanatory research blog post that publicizes two preprints.
- **Reader:** an intermediate technical reader comfortable with calculus, probability, and matrix eigenvalues, but not assumed to know polynomial capacity or exponential-family terminology.
- **Skills applied:** OCAR writing; expectation flow; sentence fluidity, including their required rule and diagnosis references.
- **Scope:** full-document structural and expectation review, an original-draft transition audit, and a prose/formula reread of the revision. The numerical transition score below describes the original draft only; no invented before/after score is reported.
- **Reading units:** prose sentences, stand-alone connective fragments, complete display equations, and the capacity comparison table. Displays are kept in the sequence, not skipped. Headings establish context without adding a scored unit. This segmentation exposes the many prose-to-formula transitions in mathematical writing.

These are editorial heuristics for this English-language reader model, not measured reader responses. Expert readers will bridge some gaps more readily. I treated recognizable mathematical continuations and explicit opening phrases as cross-paragraph bridges; paragraph breaks were not automatically scored as failures.

## Summary dashboard

| Lens              | Original assessment                                         | Revision                                                                                |
| ----------------- | ----------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| OCAR opening      | Engaging classifier hook; publicity purpose appears late    | Names and links both preprints immediately after the hook                               |
| OCAR challenge    | A tour is promised, but its practical questions are delayed | States attainable targets, divergent parameters, and the shared zero calculation        |
| OCAR action       | Strong running example and derivations                      | Retains the mathematics; moves the tiny-eigenvalue challenge before the spectral method |
| OCAR resolution   | Memorable ending; no explicit reading destination           | Keeps the ending and adds a concise link to each paper                                  |
| Expectation flow  | Two delayed promises and several weak section bridges       | Names the next operation or question at the main boundaries                             |
| Sentence fluidity | Formula → interpretation is the strongest pattern           | Preserves that pattern and repairs backward-looking handoffs                            |
| Claim precision   | Mostly careful; a few wording and notation errors           | Clarifies relative odds, convex-hull interior, weighted permanent, and M versus log M   |

OCAR triage: Opening B, Challenge C, Action A, Resolution B. The revision brings the Challenge into the opening and puts the spectral problem before its method. The resulting section route is **hook → shared object → target-matching problem → capacity → geometry and entropy → spectral problem → complex zeros → return to capacity → preprint links**.

## Section and paragraph-group review

Paragraph IDs refer to the original text; the appendix records every reading unit and its paragraph.

| Original paragraphs | Role and expectation                                   | Main finding / revision                                                                                                                               |
| ------------------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| P1–P8               | Opening: classifier loss → reason to follow the tour   | “Now put that formula aside” defers the hook. Replace the itinerary with a specific payoff and name the preprints.                                    |
| P9–P22              | Weighted polynomial → real exponents → positivity      | Keep the example and joke. Bridge back to exponents explicitly and explain that positivity permits logarithms.                                        |
| P23–P39             | Coordinate change → partition function → normalization | Keep the exact substitution. Narrow the geometric-programming claim and reduce the vocabulary detour.                                                 |
| P40–P61             | PGF → MGF → cumulants → factorization                  | Strongest explanatory sequence. Keep the independent-coin-flip payoff and connect it forward to softmax.                                              |
| P62–P74             | Tilt → softmax → gradient/covariance                   | Retain the identities. End on matching an average exponent to a target.                                                                               |
| P75–P96             | Capacity → loss identity → moment matching             | Preserve the target table and identity. Explain finite optima first; give boundary behavior its own section.                                          |
| P97–P107            | Convex hull → boundary → constrained hard label        | Correct “interior point of {0,1,2}” to interior of the convex hull [0,2]. Add the approximate maximum probability, 0.505.                             |
| P108–P117           | Shared parameters → dataset product → separation       | Define q_ij and alpha_i; display the bias constant explicitly. Explain quasi-separation and distinguish objective geometry from an optimizer theorem. |
| P118–P132           | Capacity value → entropy dual → rare-event bound       | Define relative entropy and cite the named work. Restrict the coefficient/PGF argument to ordinary polynomials.                                       |
| P133–P147           | Coefficient bound → permanent → zero restriction       | Change “counts” to “sums the weights.” Announce the upcoming matrix construction before promising a return to zeros.                                  |
| P148–P171           | Spectrum → moments → derivative estimate               | Move the epsilon-eigenvalue challenge before the construction; state explicitly that trace powers give values while log-determinant asks for a slope. |
| P172–P202           | Complex zeros → two-term radius → interpretation       | Preserve the derivation and scope limits. Make the normalization-to-MGF step explicit and handle zero slope spread.                                   |
| P203–P225           | Spectral probabilities → KL → Chernoff → capacity      | Preserve the follow-on derivation and identify its status. Distinguish M from K in the summary.                                                       |
| P226–P233           | Synthesis and closure                                  | Correct “capacity” to “log-capacity” for the minimized log objective; add the preprint reading links.                                                 |

## Expectation-flow diagnostics and fixes

| Flag                                        | Original span                                                                                                | What it makes the reader expect            | Revision                                                                                                       |
| ------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------ | -------------------------------------------------------------------------------------------------------------- |
| ORPHANED_EXPECTATION (temporarily deferred) | “Eventually we will arrive back at cross-entropy.”                                                           | A reason that the intervening tour matters | The opening names three questions the route will answer; Section 4 pays the exact identity.                    |
| TOPIC_DERAILMENT                            | “We are about to meet them again.” → “Now consider a symmetric positive definite matrix…”                    | Complex zeros immediately                  | “First, we need the exponential sum associated with a matrix.” makes the prerequisite explicit.                |
| ORPHANED_EXPECTATION (locally deferred)     | “Sometimes the best value exists only as the parameters run off to infinity.” → attained-optimum calculation | Explanation of the infinite-parameter case | Finish finite moment matching, then introduce the boundary case in Section 5.                                  |
| MISSING_QUANTIFICATION / scope              | “turns an apparently awkward multiplicative optimization problem into a convex one”                          | A statement of which problems qualify      | Name the standard posynomial objective and inequality constraints and cite the geometric-programming tutorial. |
| Weak section bridge (R1/R8/R14)             | “The log-determinant also needs to hear the quietest one.” → real/complex zeros                              | More on small-eigenvalue sensitivity       | Keep the metaphor with the spectral challenge, then end the section on the logarithm’s Taylor series.          |
| Ambiguous object in a summary               | “Its complex zeros control the reach of its Taylor expansion.”                                               | Zeros and Taylor series of one function    | “The complex zeros of M control the Taylor radius of K.”                                                       |

No systematic CLAIM_OVERLOAD or HOWEVER_OVERUSE was found. The main issue was delayed direction, not an accumulation of unsupported superlatives. The title’s playful assertion is now qualified early by the affine-logit condition and the logarithmic-ratio interpretation.

The tension arc now has identifiable releases: the opening’s loss puzzle resolves in Section 4; finite versus limiting optima resolve in Section 5; the two-paper connection resolves in Section 8; the return to capacity resolves in Section 9. The concluding links fulfill the publicity purpose.

## Technical and attribution checks

- The capacity/cross-entropy relation is retained for a fixed affine-logit family. The dataset formula now specifies the target averages and the subtracted bias constant.
- Exponential tilting raises **relative odds** between outcomes according to projection differences; it does not make every outcome above some unspecified projection threshold monotonically more probable.
- The exponent 1 is interior to the convex hull [0,2], not to the discrete set {0,1,2}.
- A general nonnegative matrix permanent is a **weighted sum** of column choices. Literal counting applies to indicator matrices.
- The ordinary polynomial restriction is stated where coefficients represent lattice probabilities.
- The spectral M(t) is an MGF for log X. Its positive integer values encode moments of X. Zeros of M limit the Taylor series of log M; finite exponential sums M are entire.
- The two-term radius agrees with [Ghosts of Softmax, Section 4.2](https://arxiv.org/html/2603.13552v1) and [What Trace Powers Reveal About Log-Determinants, Proposition 6.3](https://arxiv.org/html/2601.12612v1). The equal-slope case has infinite radius.
- A Taylor convergence radius does not by itself guarantee descent or the accuracy of a finite Taylor polynomial. Polynomial interpolation needs its own error analysis. Those distinctions were already present in the supplied draft and remain explicit.
- The spectral KL/Chernoff/capacity calculation is labeled as a derivation in this post. The Chernoff definition was checked against [Nielsen’s review](https://arxiv.org/html/2207.03745v3).
- Added descriptive sources for [geometric programming](https://web.stanford.edu/~boyd/papers/gp_tutorial.html) and [Straszak–Vishnoi maximum entropy](https://proceedings.mlr.press/v99/straszak19a.html), replacing vague or missing attribution.

The post is a polished exposition, not a full peer review of either preprint. Technical descriptions are tied to the versions linked in the draft.

## Validation and delivery

- Saved the post in `_drafts/cross-entropy-is-a-polynomial-in-a-trench-coat.md` with the site's existing Jekyll post layout and metadata. It remains an unpublished draft.
- Built the site successfully with `bundle exec jekyll build --drafts --future --destination /private/tmp/cross-entropy-site-preview --disable-disk-cache`. The build emits existing dependency/Sass deprecation warnings but completes successfully.
- Inspected the local browser preview. All 180 math expressions render, with no MathJax errors, leftover dollar delimiters, or overflowing display equations at the inspected desktop viewport. The capacity comparison renders as one table.
- Replaced inline escaped-parenthesis delimiters with the site's supported dollar delimiters; used `\lvert`, `\rvert`, and `\Vert` where Markdown's pipe handling interfered with math.
- Checked the toy moments, capacity minimum, affine-softmax loss identity, spectral KL/affinity identities, and two-term complex zeros numerically. Checked paired display delimiters and all nine reference definitions.

## Sentence-fluidity audit

There are 325 reading units and 324 adjacent transitions. The original scores **907/972** under the skill’s rule: 3 × ☺ − ∅ − 2 × ☹.

| Verdict                     | Count |  Rate |
| --------------------------- | ----: | ----: |
| ☺ expectation met          |   309 | 95.4% |
| ∅ no clear next expectation |    10 |  3.1% |
| ☹ expectation missed       |     5 |  1.5% |

The skill’s literal absolute-score classification is BRILLIANT. That threshold assumes roughly ten pairs and is not informative for a document this long. The rates and diagnosed passages are more useful; the many short formula-introduction pairs also raise the total. Two ∅ transitions are deliberate opening/closing resets and were retained as rhetorical choices.

**Strongest pattern:** formula → concrete interpretation → example. **Most frequent weakness:** a completed thought that does not prepare the next subsection (D1). The important exception is the explicit complex-zero promise interrupted by the matrix setup (D7).

### Detailed traces for ∅ and ☹

#### S1 → S2: ∅, D2: teaser-to-body reset

> The complex zeros are where its cover starts to slip.\*
>
> A classifier produces a score for each possible answer: cat, dog, or toaster.

- **Formation:** F8, M1; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** no sufficiently specific next-step expectation survives (-1).
- **Diagnosis and revision:** The subtitle promises complex zeros; the body starts with classification. This is an intentional opening reset, not a substantive defect. Retain the teaser and establish the two-paper destination in the opening.
- **Recheck:** retained as an intentional rhetorical reset, not forced into a mechanical bridge.

#### S20 → S21: ☹, D7: unbridged return to exponents

> We will keep the coefficients positive, omitting any zero terms.
>
> Why insist on whole-number exponents?

- **Formation:** F1, F7, F8; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** the next unit does not fulfill the active expectation (-2).
- **Diagnosis and revision:** The prior sentence ends on positive coefficients; the next asks why exponents must be integers. Use “The weighted-list interpretation survives beyond whole-number exponents” to recover the earlier topic explicitly.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S25 → S26: ☹, D7: example changes level

> For example,
>
> $$ 3+5x^{-1/2}+2x^{1.7} $$

- **Formation:** F1, F7, F12; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** the next unit does not fulfill the active expectation (-2).
- **Diagnosis and revision:** “For example” inherits the preceding circuit-model context, but the example is an abstract posynomial. Keep the example next to the definition, then discuss engineering applications.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S30 → S31: ∅, D3: unspecified payoff

> That fact will do a surprising amount of work.
>
> Write

- **Formation:** F8, M1; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** no sufficiently specific next-step expectation survives (-1).
- **Diagnosis and revision:** “That fact will do a surprising amount of work” does not say what positivity enables. Name the next operation: taking a logarithm. The revised section then picks up that operation.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S79 → S80: ∅, D1: backward summary

> This is part of the standard exponential-family dictionary.
>
> Our polynomial even contains a little demonstration:

- **Formation:** F7, F8; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** no sufficiently specific next-step expectation survives (-1).
- **Diagnosis and revision:** “Standard exponential-family dictionary” ends a thread that the next paragraph reopens through factorization. Replace it with the specific forward link: the polynomial demonstrates additivity.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S85 → S86: ∅, D1: example closure

> A probabilist sees two coin flips.
>
> The same construction works without integer exponents.

- **Formation:** F8, F12; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** no sufficiently specific next-step expectation survives (-1).
- **Diagnosis and revision:** The two-coin-flip payoff closes the example, while “the same construction” leaves the next operation vague. Preserve the payoff and explicitly introduce the move to softmax.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S102 → S103: ∅, D1: no motivation for the new target

> It is the probability distribution naturally attached to this positive exponential sum.
>
> Now introduce a target exponent \(\alpha\).

- **Formation:** F7, F8; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** no sufficiently specific next-step expectation survives (-1).
- **Diagnosis and revision:** The distribution summary does not motivate a target exponent. End with a training question about matching the average exponent to a target, then define the capacity objective.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S165 → S166: ☹, D13: unexplained separation terminology

> This includes **quasi-separation**; strict separation of every comparison is stronger.
>
> The familiar max-margin behavior of gradient descent on separable logistic regression belongs here, but it requires an additional theorem about the optimizer—not just the capacity identity. ([Journal of Machine Learning Research][3])

- **Formation:** F9, F12; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** the next unit does not fulfill the active expectation (-2).
- **Diagnosis and revision:** “Quasi-separation” and the next sentence’s “max-margin behavior” demand prior optimizer knowledge. Define the first through unchanged versus improved margins, and attach the second to a clearly attributed optimizer theorem.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S166 → S167: ∅, D1: vague return to an earlier value

> The familiar max-margin behavior of gradient descent on separable logistic regression belongs here, but it requires an additional theorem about the optimizer—not just the capacity identity. ([Journal of Machine Learning Research][3])
>
> There is another way to compute the same number.

- **Formation:** F7, F8; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** no sufficiently specific next-step expectation survives (-1).
- **Diagnosis and revision:** After an optimizer theorem, “the same number” points back to a capacity value no longer in focus. Name the capacity value and promise its entropy interpretation.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S186 → S187: ∅, D1: rare-event closure

> The number attached to a polynomial is pricing a rare event.
>
> For any nonnegative-coefficient polynomial,

- **Formation:** F7, F8; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** no sufficiently specific next-step expectation survives (-1).
- **Diagnosis and revision:** “Pricing a rare event” is a good payoff but leaves the coefficient detour unmotivated. Extend the payoff with the coefficient-versus-positive-sum fact used in the next subsection.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S205 → S206: ☹, D7: explicit promise interrupted

> We are about to meet them again.
>
> Now consider a symmetric positive definite matrix \(B\), with eigenvalues \(\lambda_1,\ldots,\lambda_n>0\).

- **Formation:** F3, F7, F8, F9; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** the next unit does not fulfill the active expectation (-2).
- **Diagnosis and revision:** “We are about to meet them again” promises complex zeros, then introduces an SPD matrix and a long spectral construction. State the question about zeros and explicitly announce the matrix construction as the prerequisite.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S235 → S236: ∅, D1: spectral ending lacks an analytic bridge

> The log-determinant also needs to hear the quietest one.
>
> Our positive exponential sums never vanish for real arguments.

- **Formation:** F7, F8; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** no sufficiently specific next-step expectation survives (-1).
- **Diagnosis and revision:** The quiet-eigenvalue metaphor closes the spectral discussion. The next section opens on exponential sums and complex arguments. Move the tiny-eigenvalue example before the estimator and end the section on the logarithm and its Taylor series.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S280 → S281: ∅, D1: return from optimization is unprepared

> Turning them into an optimizer’s safety guarantee requires more.
>
> We can push the spectral construction one step further.

- **Formation:** F7, F8; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** no sufficiently specific next-step expectation survives (-1).
- **Diagnosis and revision:** The final sentence asks for an optimizer safety guarantee, while the next returns to a spectral construction. Resolve the scope of the radius, then announce that the spectral curve’s minimum returns us to capacity.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S306 → S307: ☹, D8: function referent changes

> Its minimum is a posynomial capacity—and a hypothesis-testing quantity.
>
> Its complex zeros control the reach of its Taylor expansion.

- **Formation:** F1, F5, F7; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** the next unit does not fulfill the active expectation (-2).
- **Diagnosis and revision:** “Its minimum” refers to M, but “its complex zeros control ... its Taylor expansion” needs the Taylor expansion of K=log M. Replace the pronoun sequence with explicit M and K references. M itself is entire.
- **Recheck:** the revised passage explicitly supplies the operation, antecedent, or bridge that the original transition omitted.

#### S322 → S323: ∅, D1: intentional closing reset

> Complex-zero geometry tells us how far a local series can see.\*\*
>
> The polynomial did not become something else.

- **Formation:** F7, F8; the topical or promissory expectation is described below. For ∅, the paragraph boundary removes a reliable forward prediction and revealing the next opening does not fully recover it.
- **Evaluation:** no sufficiently specific next-step expectation survives (-1).
- **Diagnosis and revision:** The three-part geometry/entropy/zeros summary is followed by the costume metaphor. Preserve this deliberate rhetorical closure. Add the two paper links before the final couplet so the publicity goal also has a concrete payoff.
- **Recheck:** retained as an intentional rhetorical reset, not forced into a mechanical bridge.

### Complete transition table

Rules list the principal editorial basis, not an exhaustive lexical-trigger log. F8 denotes a paragraph boundary; successful cross-paragraph transitions retain context through an explicit reference, recognizable mathematical continuation, or the partial-reveal rescue V4. The table uses original sentence/reading-unit IDs.

| Pair      | Paragraphs | Verdict |       Score | Principal rules | Diagnosis                                    |
| --------- | ---------- | ------- | ----------: | --------------- | -------------------------------------------- |
| S0→S1     | P1→P1      | ☺      |          +3 | F1, F7          | —                                            |
| S1→S2     | P1→P2      | ∅       |          -1 | F8, M1          | D2: teaser-to-body reset                     |
| S2→S3     | P2→P2      | ☺      |          +3 | F1, F7          | —                                            |
| S3→S4     | P2→P3      | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S4→S5     | P3→P4      | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S5→S6     | P4→P5      | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S6→S7     | P5→P6      | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S7→S8     | P6→P7      | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S8→S9     | P7→P7      | ☺      |          +3 | F1, F7          | —                                            |
| S9→S10    | P7→P7      | ☺      |          +3 | F1, F7          | —                                            |
| S10→S11   | P7→P8      | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S11→S12   | P8→P9      | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S12→S13   | P9→P10     | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S13→S14   | P10→P11    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S14→S15   | P11→P11    | ☺      |          +3 | F1, F7          | —                                            |
| S15→S16   | P11→P12    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S16→S17   | P12→P13    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S17→S18   | P13→P14    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S18→S19   | P14→P15    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S19→S20   | P15→P15    | ☺      |          +3 | F1, F7          | —                                            |
| S20→S21   | P15→P16    | ☹      |          -2 | F1, F7, F8      | D7: unbridged return to exponents            |
| S21→S22   | P16→P17    | ☺      |          +3 | F3, F8/V4       | —                                            |
| S22→S23   | P17→P17    | ☺      |          +3 | F1, F7          | —                                            |
| S23→S24   | P17→P17    | ☺      |          +3 | F1, F12         | —                                            |
| S24→S25   | P17→P18    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S25→S26   | P18→P19    | ☹      |          -2 | F1, F7, F12     | D7: example changes level                    |
| S26→S27   | P19→P20    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S27→S28   | P20→P21    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S28→S29   | P21→P21    | ☺      |          +3 | F1, F7          | —                                            |
| S29→S30   | P21→P22    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S30→S31   | P22→P23    | ∅       |          -1 | F8, M1          | D3: unspecified payoff                       |
| S31→S32   | P23→P24    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S32→S33   | P24→P25    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S33→S34   | P25→P26    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S34→S35   | P26→P27    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S35→S36   | P27→P28    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S36→S37   | P28→P29    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S37→S38   | P29→P30    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S38→S39   | P30→P31    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S39→S40   | P31→P31    | ☺      |          +3 | F1, F7          | —                                            |
| S40→S41   | P31→P32    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S41→S42   | P32→P33    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S42→S43   | P33→P34    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S43→S44   | P34→P34    | ☺      |          +3 | F1, F7          | —                                            |
| S44→S45   | P34→P35    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S45→S46   | P35→P35    | ☺      |          +3 | F1, F7          | —                                            |
| S46→S47   | P35→P35    | ☺      |          +3 | F1, F7          | —                                            |
| S47→S48   | P35→P36    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S48→S49   | P36→P36    | ☺      |          +3 | F1, F7          | —                                            |
| S49→S50   | P36→P37    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S50→S51   | P37→P38    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S51→S52   | P38→P38    | ☺      |          +3 | F1, F7          | —                                            |
| S52→S53   | P38→P39    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S53→S54   | P39→P40    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S54→S55   | P40→P41    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S55→S56   | P41→P42    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S56→S57   | P42→P43    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S57→S58   | P43→P44    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S58→S59   | P44→P44    | ☺      |          +3 | F1, F7          | —                                            |
| S59→S60   | P44→P45    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S60→S61   | P45→P46    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S61→S62   | P46→P46    | ☺      |          +3 | F1, F12         | —                                            |
| S62→S63   | P46→P47    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S63→S64   | P47→P48    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S64→S65   | P48→P49    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S65→S66   | P49→P49    | ☺      |          +3 | F1, F12         | —                                            |
| S66→S67   | P49→P49    | ☺      |          +3 | F1, F7          | —                                            |
| S67→S68   | P49→P50    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S68→S69   | P50→P51    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S69→S70   | P51→P52    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S70→S71   | P52→P53    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S71→S72   | P53→P54    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S72→S73   | P54→P54    | ☺      |          +3 | F1, F12         | —                                            |
| S73→S74   | P54→P54    | ☺      |          +3 | F1, F7          | —                                            |
| S74→S75   | P54→P55    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S75→S76   | P55→P56    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S76→S77   | P56→P56    | ☺      |          +3 | F3              | —                                            |
| S77→S78   | P56→P56    | ☺      |          +3 | F1, F7          | —                                            |
| S78→S79   | P56→P56    | ☺      |          +3 | F1, F7          | —                                            |
| S79→S80   | P56→P57    | ∅       |          -1 | F7, F8          | D1: backward summary                         |
| S80→S81   | P57→P58    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S81→S82   | P58→P59    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S82→S83   | P59→P59    | ☺      |          +3 | F1, F7          | —                                            |
| S83→S84   | P59→P60    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S84→S85   | P60→P61    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S85→S86   | P61→P62    | ∅       |          -1 | F8, F12         | D1: example closure                          |
| S86→S87   | P62→P63    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S87→S88   | P63→P63    | ☺      |          +3 | F1, F7          | —                                            |
| S88→S89   | P63→P64    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S89→S90   | P64→P65    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S90→S91   | P65→P66    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S91→S92   | P66→P67    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S92→S93   | P67→P67    | ☺      |          +3 | F1, F12         | —                                            |
| S93→S94   | P67→P68    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S94→S95   | P68→P69    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S95→S96   | P69→P70    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S96→S97   | P70→P71    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S97→S98   | P71→P72    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S98→S99   | P72→P73    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S99→S100  | P73→P73    | ☺      |          +3 | F1, F7          | —                                            |
| S100→S101 | P73→P74    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S101→S102 | P74→P74    | ☺      |          +3 | F1, F7          | —                                            |
| S102→S103 | P74→P75    | ∅       |          -1 | F7, F8          | D1: no motivation for the new target         |
| S103→S104 | P75→P75    | ☺      |          +3 | F1, F7          | —                                            |
| S104→S105 | P75→P76    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S105→S106 | P76→P77    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S106→S107 | P77→P77    | ☺      |          +3 | F1, F7          | —                                            |
| S107→S108 | P77→P78    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S108→S109 | P78→P78    | ☺      |          +3 | F1, F7          | —                                            |
| S109→S110 | P78→P79    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S110→S111 | P79→P80    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S111→S112 | P80→P81    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S112→S113 | P81→P82    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S113→S114 | P82→P83    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S114→S115 | P83→P84    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S115→S116 | P84→P85    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S116→S117 | P85→P86    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S117→S118 | P86→P87    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S118→S119 | P87→P88    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S119→S120 | P88→P89    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S120→S121 | P89→P90    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S121→S122 | P90→P90    | ☺      |          +3 | F1, F7          | —                                            |
| S122→S123 | P90→P91    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S123→S124 | P91→P92    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S124→S125 | P92→P92    | ☺      |          +3 | F1, F7          | —                                            |
| S125→S126 | P92→P93    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S126→S127 | P93→P93    | ☺      |          +3 | F1, F7          | —                                            |
| S127→S128 | P93→P94    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S128→S129 | P94→P95    | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S129→S130 | P95→P96    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S130→S131 | P96→P97    | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S131→S132 | P97→P98    | ☺      |          +3 | F3, F8/V4       | —                                            |
| S132→S133 | P98→P99    | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S133→S134 | P99→P100   | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S134→S135 | P100→P101  | ☺      |          +3 | F1, F12, F8/V4  | —                                            |
| S135→S136 | P101→P101  | ☺      |          +3 | F1, F7          | —                                            |
| S136→S137 | P101→P101  | ☺      |          +3 | F1, F7          | —                                            |
| S137→S138 | P101→P101  | ☺      |          +3 | F1, F7          | —                                            |
| S138→S139 | P101→P102  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S139→S140 | P102→P102  | ☺      |          +3 | F1, F7          | —                                            |
| S140→S141 | P102→P102  | ☺      |          +3 | F1, F7          | —                                            |
| S141→S142 | P102→P102  | ☺      |          +3 | F1, F7          | —                                            |
| S142→S143 | P102→P103  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S143→S144 | P103→P104  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S144→S145 | P104→P104  | ☺      |          +3 | F1, F7          | —                                            |
| S145→S146 | P104→P104  | ☺      |          +3 | F1, F7          | —                                            |
| S146→S147 | P104→P104  | ☺      |          +3 | F1, F7          | —                                            |
| S147→S148 | P104→P105  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S148→S149 | P105→P105  | ☺      |          +3 | F1, F7          | —                                            |
| S149→S150 | P105→P105  | ☺      |          +3 | F1, F7          | —                                            |
| S150→S151 | P105→P106  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S151→S152 | P106→P107  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S152→S153 | P107→P107  | ☺      |          +3 | F1, F7          | —                                            |
| S153→S154 | P107→P108  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S154→S155 | P108→P109  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S155→S156 | P109→P110  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S156→S157 | P110→P110  | ☺      |          +3 | F1, F7          | —                                            |
| S157→S158 | P110→P111  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S158→S159 | P111→P112  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S159→S160 | P112→P112  | ☺      |          +3 | F1, F7          | —                                            |
| S160→S161 | P112→P113  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S161→S162 | P113→P114  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S162→S163 | P114→P115  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S163→S164 | P115→P116  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S164→S165 | P116→P116  | ☺      |          +3 | F1, F7          | —                                            |
| S165→S166 | P116→P117  | ☹      |          -2 | F9, F12         | D13: unexplained separation terminology      |
| S166→S167 | P117→P118  | ∅       |          -1 | F7, F8          | D1: vague return to an earlier value         |
| S167→S168 | P118→P119  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S168→S169 | P119→P119  | ☺      |          +3 | F1, F7          | —                                            |
| S169→S170 | P119→P120  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S170→S171 | P120→P121  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S171→S172 | P121→P122  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S172→S173 | P122→P123  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S173→S174 | P123→P123  | ☺      |          +3 | F1, F7          | —                                            |
| S174→S175 | P123→P124  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S175→S176 | P124→P124  | ☺      |          +3 | F1, F7          | —                                            |
| S176→S177 | P124→P125  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S177→S178 | P125→P126  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S178→S179 | P126→P127  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S179→S180 | P127→P128  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S180→S181 | P128→P128  | ☺      |          +3 | F1, F7          | —                                            |
| S181→S182 | P128→P128  | ☺      |          +3 | F1, F7          | —                                            |
| S182→S183 | P128→P129  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S183→S184 | P129→P130  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S184→S185 | P130→P131  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S185→S186 | P131→P132  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S186→S187 | P132→P133  | ∅       |          -1 | F7, F8          | D1: rare-event closure                       |
| S187→S188 | P133→P134  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S188→S189 | P134→P135  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S189→S190 | P135→P136  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S190→S191 | P136→P137  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S191→S192 | P137→P138  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S192→S193 | P138→P139  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S193→S194 | P139→P139  | ☺      |          +3 | F1, F7          | —                                            |
| S194→S195 | P139→P140  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S195→S196 | P140→P141  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S196→S197 | P141→P141  | ☺      |          +3 | F1, F7          | —                                            |
| S197→S198 | P141→P142  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S198→S199 | P142→P143  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S199→S200 | P143→P144  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S200→S201 | P144→P144  | ☺      |          +3 | F1, F7          | —                                            |
| S201→S202 | P144→P145  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S202→S203 | P145→P145  | ☺      |          +3 | F1, F7          | —                                            |
| S203→S204 | P145→P146  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S204→S205 | P146→P147  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S205→S206 | P147→P148  | ☹      |          -2 | F3, F7, F8, F9  | D7: explicit promise interrupted             |
| S206→S207 | P148→P149  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S207→S208 | P149→P150  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S208→S209 | P150→P151  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S209→S210 | P151→P152  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S210→S211 | P152→P153  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S211→S212 | P153→P153  | ☺      |          +3 | F1, F7          | —                                            |
| S212→S213 | P153→P154  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S213→S214 | P154→P154  | ☺      |          +3 | F1, F7          | —                                            |
| S214→S215 | P154→P155  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S215→S216 | P155→P156  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S216→S217 | P156→P157  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S217→S218 | P157→P158  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S218→S219 | P158→P159  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S219→S220 | P159→P160  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S220→S221 | P160→P161  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S221→S222 | P161→P162  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S222→S223 | P162→P163  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S223→S224 | P163→P164  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S224→S225 | P164→P164  | ☺      |          +3 | F1, F7          | —                                            |
| S225→S226 | P164→P164  | ☺      |          +3 | F1, F7          | —                                            |
| S226→S227 | P164→P164  | ☺      |          +3 | F1, F7          | —                                            |
| S227→S228 | P164→P165  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S228→S229 | P165→P165  | ☺      |          +3 | F1, F7          | —                                            |
| S229→S230 | P165→P166  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S230→S231 | P166→P167  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S231→S232 | P167→P168  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S232→S233 | P168→P169  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S233→S234 | P169→P170  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S234→S235 | P170→P171  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S235→S236 | P171→P172  | ∅       |          -1 | F7, F8          | D1: spectral ending lacks an analytic bridge |
| S236→S237 | P172→P172  | ☺      |          +3 | F1, F7          | —                                            |
| S237→S238 | P172→P173  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S238→S239 | P173→P174  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S239→S240 | P174→P175  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S240→S241 | P175→P175  | ☺      |          +3 | F1, F7          | —                                            |
| S241→S242 | P175→P176  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S242→S243 | P176→P177  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S243→S244 | P177→P178  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S244→S245 | P178→P179  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S245→S246 | P179→P179  | ☺      |          +3 | F1, F7          | —                                            |
| S246→S247 | P179→P179  | ☺      |          +3 | F1, F7          | —                                            |
| S247→S248 | P179→P180  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S248→S249 | P180→P180  | ☺      |          +3 | F1, F7          | —                                            |
| S249→S250 | P180→P181  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S250→S251 | P181→P182  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S251→S252 | P182→P183  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S252→S253 | P183→P183  | ☺      |          +3 | F1, F7          | —                                            |
| S253→S254 | P183→P183  | ☺      |          +3 | F1, F7          | —                                            |
| S254→S255 | P183→P184  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S255→S256 | P184→P184  | ☺      |          +3 | F1, F7          | —                                            |
| S256→S257 | P184→P185  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S257→S258 | P185→P186  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S258→S259 | P186→P187  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S259→S260 | P187→P188  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S260→S261 | P188→P189  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S261→S262 | P189→P190  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S262→S263 | P190→P191  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S263→S264 | P191→P192  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S264→S265 | P192→P193  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S265→S266 | P193→P194  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S266→S267 | P194→P195  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S267→S268 | P195→P195  | ☺      |          +3 | F1, F7          | —                                            |
| S268→S269 | P195→P196  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S269→S270 | P196→P197  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S270→S271 | P197→P198  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S271→S272 | P198→P199  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S272→S273 | P199→P199  | ☺      |          +3 | F1, F7          | —                                            |
| S273→S274 | P199→P199  | ☺      |          +3 | F1, F7          | —                                            |
| S274→S275 | P199→P200  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S275→S276 | P200→P201  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S276→S277 | P201→P201  | ☺      |          +3 | F1, F7          | —                                            |
| S277→S278 | P201→P201  | ☺      |          +3 | F1, F7          | —                                            |
| S278→S279 | P201→P202  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S279→S280 | P202→P202  | ☺      |          +3 | F1, F7          | —                                            |
| S280→S281 | P202→P203  | ∅       |          -1 | F7, F8          | D1: return from optimization is unprepared   |
| S281→S282 | P203→P203  | ☺      |          +3 | F1, F7          | —                                            |
| S282→S283 | P203→P204  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S283→S284 | P204→P205  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S284→S285 | P205→P206  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S285→S286 | P206→P207  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S286→S287 | P207→P208  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S287→S288 | P208→P209  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S288→S289 | P209→P210  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S289→S290 | P210→P211  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S290→S291 | P211→P211  | ☺      |          +3 | F1, F7          | —                                            |
| S291→S292 | P211→P212  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S292→S293 | P212→P213  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S293→S294 | P213→P214  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S294→S295 | P214→P215  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S295→S296 | P215→P216  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S296→S297 | P216→P217  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S297→S298 | P217→P218  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S298→S299 | P218→P219  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S299→S300 | P219→P219  | ☺      |          +3 | F1, F7          | —                                            |
| S300→S301 | P219→P220  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S301→S302 | P220→P221  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S302→S303 | P221→P222  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S303→S304 | P222→P223  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S304→S305 | P223→P223  | ☺      |          +3 | F1, F7          | —                                            |
| S305→S306 | P223→P223  | ☺      |          +3 | F1, F7          | —                                            |
| S306→S307 | P223→P223  | ☹      |          -2 | F1, F5, F7      | D8: function referent changes                |
| S307→S308 | P223→P224  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S308→S309 | P224→P225  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S309→S310 | P225→P226  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S310→S311 | P226→P227  | ☺      |          +3 | F1, F5, F8/V4   | —                                            |
| S311→S312 | P227→P228  | ☺      |          +3 | F1, F11, F8/V4  | —                                            |
| S312→S313 | P228→P228  | ☺      |          +3 | F1, F7          | —                                            |
| S313→S314 | P228→P228  | ☺      |          +3 | F1, F7          | —                                            |
| S314→S315 | P228→P228  | ☺      |          +3 | F1, F7          | —                                            |
| S315→S316 | P228→P229  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S316→S317 | P229→P229  | ☺      |          +3 | F1, F7          | —                                            |
| S317→S318 | P229→P229  | ☺      |          +3 | F1, F7          | —                                            |
| S318→S319 | P229→P230  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S319→S320 | P230→P231  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| S320→S321 | P231→P231  | ☺      |          +3 | F1, F7          | —                                            |
| S321→S322 | P231→P231  | ☺      |          +3 | F1, F7          | —                                            |
| S322→S323 | P231→P232  | ∅       |          -1 | F7, F8          | D1: intentional closing reset                |
| S323→S324 | P232→P233  | ☺      |          +3 | F1, F7, F8/V4   | —                                            |
| **Total** |            |         | **907/972** |                 |                                              |

### Original reading-unit index

The index preserves mathematical content for auditing. Paragraph IDs make the table usable without relying on source-file line numbers.

#### Opening

- **S0 / P1**: `*It also moonlights as a partition function, a cumulant generator, and a tool for understanding log-determinants.`
- **S1 / P1**: `The complex zeros are where its cover starts to slip.*`
- **S2 / P2**: `A classifier produces a score for each possible answer: cat, dog, or toaster.`
- **S3 / P2**: `Softmax turns those scores into probabilities:`
- **S4 / P3**: `$$ p_j=\frac{e^{z_j}}{\sum_k e^{z_k}}. $$`
- **S5 / P4**: `The cross-entropy loss asks how much probability went to the correct answer \(y\), then takes the negative logarithm:`
- **S6 / P5**: `$$ \mathrm{CE} = -\log p_y = \log\left(\sum_j e^{z_j}\right)-z_y. $$`
- **S7 / P6**: `A log of a pile of exponentials, minus the score you wanted to win.`
- **S8 / P7**: `Now put that formula aside.`
- **S9 / P7**: `We are going to start with a polynomial and walk through algebra, engineering, probability, combinatorics, and matrix computation.`
- **S10 / P7**: `Eventually we will arrive back at cross-entropy.`
- **S11 / P8**: `The suspicious part is how little the formula changes along the way.`

#### 1. A polynomial leaves school

- **S12 / P9**: `Consider`
- **S13 / P10**: `$$ P(x)=3+5x+2x^2. $$`
- **S14 / P11**: `At school, you might factor it, differentiate it, or find its roots.`
- **S15 / P11**: `But there is another way to read it: **the coefficients are weights, and the exponents describe the things being weighted**.`
- **S16 / P12**: `Here, exponent \(0\) gets weight \(3\), exponent \(1\) gets weight \(5\), and exponent \(2\) gets weight \(2\).`
- **S17 / P13**: `In several variables, the same idea becomes`
- **S18 / P14**: `$$ P(x)=\sum_j c_jx^{a_j}, \qquad x^{a_j}:=\prod_{\ell=1}^d x_\ell^{a_{j\ell}}. $$`
- **S19 / P15**: `For an ordinary polynomial, the exponent vectors \(a_j\) have nonnegative integer coordinates.`
- **S20 / P15**: `We will keep the coefficients positive, omitting any zero terms.`
- **S21 / P16**: `Why insist on whole-number exponents?`
- **S22 / P17**: `Engineering models routinely contain square roots, inverse powers, and empirically fitted exponents.`
- **S23 / P17**: `If we allow arbitrary real \(a_{j\ell}\), while keeping \(c_j>0\) and \(x_\ell>0\), the expression is called a **posynomial**.`
- **S24 / P17**: `Such functions appear in geometric programming, including models for circuit sizing and trade-offs among delay, area, and power.`
- **S25 / P18**: `For example,`
- **S26 / P19**: `$$ 3+5x^{-1/2}+2x^{1.7} $$`
- **S27 / P20**: `is not an ordinary polynomial, but it is a posynomial.`
- **S28 / P21**: `The name sounds like a polynomial with a positive attitude.`
- **S29 / P21**: `The actual requirement is more useful: positive coefficients mean the terms cannot cancel on the positive real axis.`
- **S30 / P22**: `That fact will do a surprising amount of work.`

#### 2. The change of variables that changes the neighborhood

- **S31 / P23**: `Write`
- **S32 / P24**: `$$ x_\ell=e^{\theta_\ell}. $$`
- **S33 / P25**: `Then every monomial becomes an exponential:`
- **S34 / P26**: `$$ c_jx^{a_j} = c_je^{\langle a_j,\theta\rangle} = e^{\langle a_j,\theta\rangle+\log c_j}. $$`
- **S35 / P27**: `Our polynomial—or posynomial—has become`
- **S36 / P28**: `$$ Z(\theta) = P(e^\theta) = \sum_j c_je^{\langle a_j,\theta\rangle}. $$`
- **S37 / P29**: `For the running example,`
- **S38 / P30**: `$$ Z(\theta)=3+5e^\theta+2e^{2\theta}. $$`
- **S39 / P31**: `Nothing has been approximated.`
- **S40 / P31**: `We have changed coordinates.`
- **S41 / P32**: `Now take a logarithm:`
- **S42 / P33**: `$$ A(\theta)=\log Z(\theta). $$`
- **S43 / P34**: `This is a log-sum-exp of affine functions.`
- **S44 / P34**: `In geometric programming, this transformation exposes convexity and turns an apparently awkward multiplicative optimization problem into a convex one.`
- **S45 / P35**: `In statistics, \(Z\) is a **partition function**, and \(A\) is a **log-partition function**.`
- **S46 / P35**: `Normalizing the individual terms gives an exponential-family distribution.`
- **S47 / P35**: `Finite-state Gibbs models use the same construction: choose weights proportional to \(e^{-\beta E_j}\), where \(E_j\) is an energy, and divide by their sum. ([People @ EECS][1])`
- **S48 / P36**: `The vocabulary changes with the application.`
- **S49 / P36**: `The machinery does not:`
- **S50 / P37**: `$$ \boxed{ \text{positive-coefficient polynomial} \;\longrightarrow\; \text{posynomial} \;\xrightarrow{x=e^\theta}\; \text{positive sum of exponentials}. } $$`
- **S51 / P38**: `The first arrow relaxes the exponents.`
- **S52 / P38**: `The second changes coordinates.`
- **S53 / P39**: `The next step turns the whole thing into probability.`

#### 3. A generating function gets a probability distribution

- **S54 / P40**: `Our running polynomial has total coefficient weight`
- **S55 / P41**: `$$ P(1)=3+5+2=10. $$`
- **S56 / P42**: `Divide by ten:`
- **S57 / P43**: `$$ G(x)=\frac{P(x)}{10} = 0.3+0.5x+0.2x^2. $$`
- **S58 / P44**: `Now imagine a random variable \(T\) that equals \(0,1,2\) with probabilities \(0.3,0.5,0.2\).`
- **S59 / P44**: `Then, directly from the definition of expectation,`
- **S60 / P45**: `$$ G(x)=\mathbb E[x^T]. $$`
- **S61 / P46**: `This is its **probability-generating function**.`
- **S62 / P46**: `The coefficient of \(x^k\) is the probability that \(T=k\).`
- **S63 / P47**: `Substitute \(x=e^s\):`
- **S64 / P48**: `$$ M(s)=G(e^s) = \mathbb E[e^{sT}]. $$`
- **S65 / P49**: `That is the **moment-generating function**.`
- **S66 / P49**: `Its name is unusually honest.`
- **S67 / P49**: `Differentiate \(r\) times and evaluate at zero:`
- **S68 / P50**: `$$ M^{(r)}(0)=\mathbb E[T^r]. $$`
- **S69 / P51**: `The substitution has turned exponents into moments.`
- **S70 / P52**: `Finally, take the logarithm:`
- **S71 / P53**: `$$ K(s)=\log M(s). $$`
- **S72 / P54**: `This is the **cumulant-generating function**.`
- **S73 / P54**: `Its first derivative gives the mean, its second gives the variance, and its higher derivatives give higher cumulants.`
- **S74 / P54**: `For our toy distribution,`
- **S75 / P55**: `$$ K'(0)=0.9, \qquad K''(0)=0.49. $$`
- **S76 / P56**: `Why introduce cumulants when moments already exist?`
- **S77 / P56**: `One reason is that cumulants **add for independent sums**.`
- **S78 / P56**: `Moment-generating functions multiply; taking the logarithm turns that multiplication into addition.`
- **S79 / P56**: `This is part of the standard exponential-family dictionary.`
- **S80 / P57**: `Our polynomial even contains a little demonstration:`
- **S81 / P58**: `$$ G(x) = \frac{1+x}{2}\, \frac{3+2x}{5}. $$`
- **S82 / P59**: `The first factor describes a Bernoulli random variable with success probability \(1/2\); the second describes one with success probability \(2/5\).`
- **S83 / P59**: `Multiplying them describes their independent sum.`
- **S84 / P60**: `An algebraist sees factorization.`
- **S85 / P61**: `A probabilist sees two coin flips.`

#### Softmax is exponential tilting

- **S86 / P62**: `The same construction works without integer exponents.`
- **S87 / P63**: `Let \(C=\sum_jc_j\), and let a random vector \(T\) take value \(a_j\) with probability \(c_j/C\).`
- **S88 / P63**: `Then`
- **S89 / P64**: `$$ \frac{Z(\theta)}{Z(0)} = \mathbb E[e^{\langle\theta,T\rangle}]. $$`
- **S90 / P65**: `Now change the distribution by reweighting each outcome:`
- **S91 / P66**: `$$ \pi_j(\theta) = \frac{c_je^{\langle a_j,\theta\rangle}} {\sum_kc_ke^{\langle a_k,\theta\rangle}}. $$`
- **S92 / P67**: `This is called **exponential tilting**.`
- **S93 / P67**: `Increase \(\theta\) in some direction, and outcomes with larger projections in that direction become more likely.`
- **S94 / P68**: `It is also softmax, with logits`
- **S95 / P69**: `$$ z_j(\theta)=\langle a_j,\theta\rangle+\log c_j. $$`
- **S96 / P70**: `Differentiate the log-partition function:`
- **S97 / P71**: `$$ \nabla A(\theta)=\mathbb E_{\pi_\theta}[T], \qquad \nabla^2 A(\theta)=\operatorname{Cov}_{\pi_\theta}(T). $$`
- **S98 / P72**: `These identities explain both the moment interpretation and convexity: the Hessian is a covariance matrix, so it is positive semidefinite. ([People @ EECS][1])`
- **S99 / P73**: `**The gradient is an average exponent.`
- **S100 / P73**: `The curvature is how much the exponents fluctuate.**`
- **S101 / P74**: `Softmax is not merely a trick for making positive numbers sum to one.`
- **S102 / P74**: `It is the probability distribution naturally attached to this positive exponential sum.`

#### 4. Capacity: how small can the whole pile get?

- **S103 / P75**: `Now introduce a target exponent \(\alpha\).`
- **S104 / P75**: `Define`
- **S105 / P76**: `$$ \operatorname{cap}_{\alpha}(P) = \inf_{x>0}\frac{P(x)}{x^\alpha}. $$`
- **S106 / P77**: `This is **polynomial capacity**, an optimization quantity used by Gurvits in his work on permanent inequalities.`
- **S107 / P77**: `It is not “capacity” in the sense of how expressive a machine-learning model is. ([arXiv][2])`
- **S108 / P78**: `Think of the denominator as a benchmark monomial.`
- **S109 / P78**: `Capacity asks how small the entire polynomial can become relative to that benchmark.`
- **S110 / P79**: `For \(P(x)=3+5x+2x^2\), three targets give three different outcomes:`
- **S111 / P80**: `| Target | Ratio being minimized | What happens | | ------------ | --------------------- | ------------------------------------------------------------------- | | \(\alpha=1\) | \(3/x+5+2x\) | A minimum occurs at \(x=\sqrt{3/2}\), with value \(5+2\sqrt6\). | | \(\alpha=2\) | \(3/x^2+5/x+2\) | The ratio approaches \(2\) as \(x\to\infty\), but never reaches it. | | \(\alpha=3\) | \(3/x^3+5/x^2+2/x\) | The ratio approaches zero. |`
- **S112 / P81**: `Now apply our change of variables:`
- **S113 / P82**: `$$ \log\operatorname{cap}_\alpha(P) = \inf_\theta \left[ A(\theta)-\langle\alpha,\theta\rangle \right]. $$`
- **S114 / P83**: `Compare this with cross-entropy.`
- **S115 / P84**: `For a probability vector of target labels \(q=(q_j)\), define`
- **S116 / P85**: `$$ \alpha=\sum_jq_ja_j. $$`
- **S117 / P86**: `Then`
- **S118 / P87**: `$$ \begin{aligned} \mathrm{CE}(q,\pi_\theta) &=-\sum_jq_j\log\pi_j(\theta)\\ &=A(\theta)-\langle\alpha,\theta\rangle -\sum_jq_j\log c_j. \end{aligned} $$`
- **S119 / P88**: `Therefore,`
- **S120 / P89**: `$$ \boxed{ \log\operatorname{cap}_\alpha(P) = \inf_\theta\mathrm{CE}(q,\pi_\theta) + \sum_jq_j\log c_j. } $$`
- **S121 / P90**: `For a hard label, \(q\) puts all its mass on one class.`
- **S122 / P90**: `For a soft label, \(\alpha\) is an average of exponent vectors.`
- **S123 / P91**: `This is the trench coat: **capacity minimization is cross-entropy minimization for the corresponding fixed log-linear family, up to a known constant**.`
- **S124 / P92**: `The word *infimum* matters.`
- **S125 / P92**: `Sometimes the best value exists only as the parameters run off to infinity.`
- **S126 / P93**: `There is also an immediate interpretation of an attained optimum.`
- **S127 / P93**: `Differentiating the capacity objective gives`
- **S128 / P94**: `$$ \nabla A(\theta)-\alpha = \mathbb E_{\pi_\theta}[T]-\alpha. $$`
- **S129 / P95**: `At the optimum, the tilted distribution has the target mean.`
- **S130 / P96**: `Training this softmax family is a moment-matching problem.`

#### 5. The geometry of training that never finishes

- **S131 / P97**: `Which target means can we match?`
- **S132 / P98**: `All the possible averages of the exponent vectors form their convex hull:`
- **S133 / P99**: `$$ \mathcal N(P)=\operatorname{conv}\{a_j\}. $$`
- **S134 / P100**: `For an ordinary polynomial, this is its **Newton polytope**.`
- **S135 / P101**: `The geometric rule is precise.`
- **S136 / P101**: `Capacity is positive exactly when \(\alpha\) lies in this convex hull.`
- **S137 / P101**: `A finite minimizer exists exactly when \(\alpha\) lies in its **relative interior**—the interior measured within the affine space occupied by the polytope.`
- **S138 / P101**: `This is the same geometry that governs the range of mean parameters in finite exponential families. ([People @ EECS][1])`
- **S139 / P102**: `The reason is visible in the probabilities.`
- **S140 / P102**: `At every finite \(\theta\), every term has positive probability.`
- **S141 / P102**: `To put the mean on a proper boundary face, all probability outside that face must disappear.`
- **S142 / P102**: `Exponential tilting can make it arbitrarily small, but cannot make it exactly zero at finite parameters.`
- **S143 / P103**: `The weights keep moving because the desired distribution lives at infinity.`
- **S144 / P104**: `For our polynomial, the possible means lie in \([0,2]\).`
- **S145 / P104**: `Mean \(1\) is attainable at a finite tilt.`
- **S146 / P104**: `Mean \(2\) requires all probability to concentrate on the largest exponent.`
- **S147 / P104**: `Mean \(3\) is impossible.`
- **S148 / P105**: `Notice a subtlety: even a **hard label** can correspond to an interior exponent.`
- **S149 / P105**: `In our three-class toy family, class \(1\) is an interior point of \(\{0,1,2\}\).`
- **S150 / P105**: `Its probability cannot approach one:`
- **S151 / P106**: `$$ \sup_\theta \pi_1(\theta) = \frac{5}{5+2\sqrt6}. $$`
- **S152 / P107**: `The classifier is constrained by its shared one-dimensional parameter.`
- **S153 / P107**: `It cannot independently raise the middle logit without also changing its rivals.`

#### A whole dataset is still one capacity problem

- **S154 / P108**: `Suppose example \(i\) has affine logits`
- **S155 / P109**: `$$ z_{ij}(\theta)=b_{ij}+\langle a_{ij},\theta\rangle, $$`
- **S156 / P110**: `with the same parameter vector \(\theta\) shared across examples.`
- **S157 / P110**: `Associate the posynomial`
- **S158 / P111**: `$$ P_i(x)=\sum_j e^{b_{ij}}x^{a_{ij}}. $$`
- **S159 / P112**: `Summing cross-entropies adds log-partition functions.`
- **S160 / P112**: `Adding logarithms multiplies their arguments:`
- **S161 / P113**: `$$ \sum_i \left[ \log P_i(e^\theta)-\langle\alpha_i,\theta\rangle \right] = \log \frac{\left(\prod_iP_i\right)(e^\theta)} {e^{\langle\sum_i\alpha_i,\theta\rangle}}. $$`
- **S162 / P114**: `So the infimum of the total loss is another log-capacity, with the appropriate bias constant.`
- **S163 / P115**: `The exponent polytope of the product is the Minkowski sum of the individual polytopes: take one point from each and add them.`
- **S164 / P116**: `For hard labels, a target on the relative boundary means there is a nontrivial direction that weakly improves every correct-label comparison and strictly improves at least one.`
- **S165 / P116**: `This includes **quasi-separation**; strict separation of every comparison is stronger.`
- **S166 / P117**: `The familiar max-margin behavior of gradient descent on separable logistic regression belongs here, but it requires an additional theorem about the optimizer—not just the capacity identity. ([Journal of Machine Learning Research][3])`

#### 6. Capacity has an information-theoretic secret

- **S167 / P118**: `There is another way to compute the same number.`
- **S168 / P119**: `Instead of searching over tilts \(\theta\), search over distributions \(\nu\) on the exponents whose mean is \(\alpha\).`
- **S169 / P119**: `Convex duality gives`
- **S170 / P120**: `$$ \log\operatorname{cap}_\alpha(P) = \max_{\substack{\nu_j\ge0,\;\sum_j\nu_j=1\\ \sum_j\nu_ja_j=\alpha}} \left[ H(\nu)+\sum_j\nu_j\log c_j \right], $$`
- **S171 / P121**: `where \(H(\nu)=-\sum_j\nu_j\log\nu_j\).`
- **S172 / P122**: `This is the maximum-entropy duality behind exponential families and the optimization problems studied by Straszak and Vishnoi.`
- **S173 / P123**: `When all coefficients equal one, it really is maximum entropy.`
- **S174 / P123**: `For unequal coefficients, it is more naturally a minimum-relative-entropy problem.`
- **S175 / P124**: `Let \(r_j=c_j/C\), where \(C=\sum_jc_j\).`
- **S176 / P124**: `Rearranging the expression above gives`
- **S177 / P125**: `$$ \boxed{ \log\operatorname{cap}_\alpha(P) = \log C - \min_{\mathbb E_\nu[T]=\alpha} D_{\mathrm{KL}}(\nu\|r). } $$`
- **S178 / P126**: `Capacity is the total coefficient mass, discounted by the least information-theoretic cost of forcing the mean to \(\alpha\).`
- **S179 / P127**: `That interpretation also leads to a direct probability bound.`
- **S180 / P128**: `Take the normalized generating function \(G=P/C\), and let \(T_1,\ldots,T_N\) be independent draws from its distribution.`
- **S181 / P128**: `Because generating functions multiply, the probability of a particular sum is a coefficient of \(G(x)^N\).`
- **S182 / P128**: `Nonnegative coefficients imply`
- **S183 / P129**: `$$ \Pr(T_1+\cdots+T_N=N\alpha) \le \inf_{x>0}\frac{G(x)^N}{x^{N\alpha}} = \operatorname{cap}_\alpha(G)^N, $$`
- **S184 / P130**: `whenever that lattice target is meaningful.`
- **S185 / P131**: `Thus capacity is also an exponential upper bound on the probability of an atypical average.`
- **S186 / P132**: `The number attached to a polynomial is pricing a rare event.`

#### Why Gurvits cared about coefficients

- **S187 / P133**: `For any nonnegative-coefficient polynomial,`
- **S188 / P134**: `$$ [x^\alpha]P\le\operatorname{cap}_\alpha(P), $$`
- **S189 / P135**: `because the single term \([x^\alpha]P\,x^\alpha\) cannot exceed the whole sum.`
- **S190 / P136**: `The remarkable part of Gurvits’ theory is that, for appropriately structured polynomials, one also gets useful inequalities in the other direction.`
- **S191 / P137**: `Take a nonnegative \(n\times n\) matrix \(B\), and form`
- **S192 / P138**: `$$ P_B(x)=\prod_{i=1}^n\left(\sum_{j=1}^nB_{ij}x_j\right). $$`
- **S193 / P139**: `Expanding the product chooses one column from each row.`
- **S194 / P139**: `The coefficient of \(x_1\cdots x_n\) counts the choices that use every column exactly once:`
- **S195 / P140**: `$$ [x_1\cdots x_n]P_B=\operatorname{per}(B). $$`
- **S196 / P141**: `If \(B\) is doubly stochastic, weighted AM–GM shows that \(P_B(x)\ge x_1\cdots x_n\), with equality at \(x=\mathbf1\).`
- **S197 / P141**: `Its capacity at \(\mathbf1\) is therefore one.`
- **S198 / P142**: `Gurvits’ coefficient inequality then yields`
- **S199 / P143**: `$$ \operatorname{per}(B)\ge\frac{n!}{n^n}, $$`
- **S200 / P144**: `the van der Waerden bound.`
- **S201 / P144**: `The relevant structure is real stability, a restriction on where a polynomial can have complex zeros.`
- **S202 / P145**: `That assumption does not automatically hold for a classifier’s associated polynomial or posynomial.`
- **S203 / P145**: `The change of variables transfers the capacity definition; it does not hand every neural network a permanent theorem.`
- **S204 / P146**: `Still, keep the phrase **complex zeros** in mind.`
- **S205 / P147**: `We are about to meet them again.`

#### 7. A matrix spectrum joins the party

- **S206 / P148**: `Now consider a symmetric positive definite matrix \(B\), with eigenvalues \(\lambda_1,\ldots,\lambda_n>0\).`
- **S207 / P149**: `Its log-determinant is`
- **S208 / P150**: `$$ \log\det B=\sum_i\log\lambda_i. $$`
- **S209 / P151**: `Its trace powers are`
- **S210 / P152**: `$$ p_k=\operatorname{tr}(B^k)=\sum_i\lambda_i^k. $$`
- **S211 / P153**: `The paper **“What Trace Powers Reveal About Log-Determinants”** studies what a small number of these trace powers can reveal about the log-determinant, a quantity appearing in Gaussian-process inference and Bayesian model comparison.`
- **S212 / P153**: `Its central move is to treat the exponent as a continuous variable. ([arXiv][4])`
- **S213 / P154**: `Let \(\mu=\operatorname{tr}(B)/n\), and choose a normalized eigenvalue \(X=\lambda_i/\mu\) uniformly at random.`
- **S214 / P154**: `Define`
- **S215 / P155**: `$$ M(t)=\mathbb E[X^t] = \frac1n\sum_i e^{t\log(\lambda_i/\mu)}. $$`
- **S216 / P156**: `There it is again: a positive sum of exponentials.`
- **S217 / P157**: `One distinction is essential:`
- **S218 / P158**: `**This is the moment-generating function of \(Y=\log X\), not of \(X\).**`
- **S219 / P159**: `The positive integer values are moments of \(X\); the derivatives at zero are moments of \(\log X\).`
- **S220 / P160**: `With \(K(t)=\log M(t)\),`
- **S221 / P161**: `$$ K'(0)=\frac1n\sum_i\log(\lambda_i/\mu), $$`
- **S222 / P162**: `so`
- **S223 / P163**: `$$ \boxed{ \log\det B=n\bigl(\log\mu+K'(0)\bigr). } $$`
- **S224 / P164**: `The normalization supplies two anchors, \(K(0)=K(1)=0\).`
- **S225 / P164**: `Trace powers supply further values \(K(k)\).`
- **S226 / P164**: `The paper constructs estimators by interpolating these values and differentiating the interpolating polynomial at zero.`
- **S227 / P164**: `It also develops bounds, with lower certificates requiring additional spectral information such as a positive eigenvalue floor. ([arXiv][5])`
- **S228 / P165**: `The underlying difficulty is easy to see without an estimator.`
- **S229 / P165**: `For`
- **S230 / P166**: `$$ B_\varepsilon=\operatorname{diag}(\varepsilon,1,\ldots,1), $$`
- **S231 / P167**: `we have`
- **S232 / P168**: `$$ \operatorname{tr}(B_\varepsilon^k)=n-1+\varepsilon^k, \qquad \log\det B_\varepsilon=\log\varepsilon. $$`
- **S233 / P169**: `As \(\varepsilon\to0\), its contribution to every positive trace power disappears, while its contribution to the log-determinant becomes arbitrarily negative.`
- **S234 / P170**: `Large positive powers listen to the biggest eigenvalues.`
- **S235 / P171**: `The log-determinant also needs to hear the quietest one.`

#### 8. The ghosts of the same sum

- **S236 / P172**: `Our positive exponential sums never vanish for real arguments.`
- **S237 / P172**: `But they can vanish for **complex** arguments.`
- **S238 / P173**: `For the running polynomial,`
- **S239 / P174**: `$$ P(x)=(1+x)(3+2x). $$`
- **S240 / P175**: `Its roots are \(-1\) and \(-3/2\).`
- **S241 / P175**: `Under \(x=e^\theta\), these become zeros of \(P(e^\theta)\) at`
- **S242 / P176**: `$$ \theta=(2m+1)i\pi $$`
- **S243 / P177**: `and`
- **S244 / P178**: `$$ \theta=\log(3/2)+(2m+1)i\pi, \qquad m\in\mathbb Z. $$`
- **S245 / P179**: `The moment-generating function itself is perfectly well-defined there—it simply equals zero.`
- **S246 / P179**: `Its logarithm is not analytic at those zeros.`
- **S247 / P179**: `Consequently, the cumulant-generating function’s Taylor series around zero has radius \(\pi\).`
- **S248 / P180**: `The function behaves smoothly everywhere on the real line.`
- **S249 / P180**: `Its local power series nevertheless has a finite reach.`
- **S250 / P181**: `That is the phenomenon behind **“Ghosts of Softmax.”** For affine logits along an update direction,`
- **S251 / P182**: `$$ z_j(t)=z_j(0)+a_jt, $$`
- **S252 / P183**: `the partition function is another exponential sum.`
- **S253 / P183**: `Its complex zeros determine the Taylor radius of the log-partition term.`
- **S254 / P183**: `The paper derives an exact binary formula and a multiclass lower bound under this affine-logit model. ([arXiv][6])`
- **S255 / P184**: `The connection to the log-determinant paper is especially direct.`
- **S256 / P184**: `Consider the generic two-term sum`
- **S257 / P185**: `$$ F(t)=u e^{at}+v e^{bt}, \qquad u,v>0,\quad a\ne b. $$`
- **S258 / P186**: `Its zeros satisfy`
- **S259 / P187**: `$$ e^{(b-a)t}=-\frac uv, $$`
- **S260 / P188**: `hence`
- **S261 / P189**: `$$ t_m= \frac{\log(u/v)+(2m+1)i\pi}{b-a}. $$`
- **S262 / P190**: `The nearest zero has distance`
- **S263 / P191**: `$$ \boxed{ R= \frac{\sqrt{\log^2(u/v)+\pi^2}}{|b-a|}. } $$`
- **S264 / P192**: `For **binary softmax**, \(u,v\) are exponentiated initial logits, and \(|b-a|\) is the spread of directional logit derivatives.`
- **S265 / P193**: `For a **two-point spectrum**, \(u,v\) are the spectral masses, and`
- **S266 / P194**: `$$ |b-a|=\log(\lambda_{\max}/\lambda_{\min}). $$`
- **S267 / P195**: `These are the binary-softmax and two-point spectral radius formulas in the two papers.`
- **S268 / P195**: `They are not merely analogous results: they are the same zero calculation with different meanings assigned to the symbols. ([arXiv][6])`
- **S269 / P196**: `For more than two softmax terms, the affine-logit model gives`
- **S270 / P197**: `$$ R\ge\frac{\pi}{\max_j a_j-\min_j a_j}. $$`
- **S271 / P198**: `Before the phases spread across a half-circle, positive weighted vectors cannot cancel. ([arXiv][6])`
- **S272 / P199**: `There is an important boundary on this interpretation.`
- **S273 / P199**: `A Taylor radius is **not a universal speed limit for optimization**.`
- **S274 / P199**: `For example,`
- **S275 / P200**: `$$ \ell(t)=\log(1+e^{-t}) $$`
- **S276 / P201**: `decreases for every real \(t>0\), including beyond its Taylor radius \(\pi\).`
- **S277 / P201**: `The radius limits that Taylor expansion, not the existence of a beneficial step.`
- **S278 / P201**: `Likewise, Taylor-series convergence and finite polynomial-interpolation accuracy are different questions.`
- **S279 / P202**: `The ghosts constrain local series representations.`
- **S280 / P202**: `Turning them into an optimizer’s safety guarantee requires more.`

#### 9. One last costume change: the spectrum comes back to capacity

- **S281 / P203**: `We can push the spectral construction one step further.`
- **S282 / P203**: `This is a follow-on derivation from the identities above.`
- **S283 / P204**: `Turn the eigenvalues into a probability vector:`
- **S284 / P205**: `$$ r_i=\frac{\lambda_i}{\sum_j\lambda_j}, \qquad u_i=\frac1n. $$`
- **S285 / P206**: `A direct calculation gives`
- **S286 / P207**: `$$ D_{\mathrm{KL}}(u\|r) = \log\mu-\frac1n\log\det B. $$`
- **S287 / P208**: `Equivalently,`
- **S288 / P209**: `$$ \boxed{ \log\det B = n\log\mu-nD_{\mathrm{KL}}(u\|r). } $$`
- **S289 / P210**: `At fixed trace, the log-determinant deficit from the equal-eigenvalue case is exactly a relative entropy.`
- **S290 / P211**: `A tiny eigenvalue means a tiny \(r_i\).`
- **S291 / P211**: `The uniform distribution still insists on assigning that coordinate weight \(1/n\), so the divergence notices what positive powers almost ignore.`
- **S292 / P212**: `But our spectral generating function contains more:`
- **S293 / P213**: `$$ M(t) = \frac1n\sum_i(\lambda_i/\mu)^t = \sum_i u_i^{\,1-t}r_i^{\,t}. $$`
- **S294 / P214**: `Minimizing this expression over \(0\le t\le1\), then taking its negative logarithm, gives the **Chernoff information** between \(u\) and \(r\), a quantity arising in binary hypothesis testing. ([arXiv][7])`
- **S295 / P215**: `Now define the posynomial`
- **S296 / P216**: `$$ Q(x)=\frac1n\sum_i x^{\log(\lambda_i/\mu)}. $$`
- **S297 / P217**: `Since \(Q(e^t)=M(t)\),`
- **S298 / P218**: `$$ \operatorname{cap}_0(Q)=\inf_{t\in\mathbb R}M(t). $$`
- **S299 / P219**: `Convexity of \(\log M(t)\), together with \(M(0)=M(1)=1\), ensures that a global minimum can be found in \([0,1]\).`
- **S300 / P219**: `Therefore,`
- **S301 / P220**: `$$ \boxed{ \operatorname{cap}_0(Q) = e^{-C(u,r)}, } $$`
- **S302 / P221**: `where \(C(u,r)\) is Chernoff information.`
- **S303 / P222**: `So this one spectral curve has several interpretations.`
- **S304 / P223**: `Its values at positive integers encode trace powers.`
- **S305 / P223**: `Its slope at zero gives the normalized log-determinant.`
- **S306 / P223**: `Its minimum is a posynomial capacity—and a hypothesis-testing quantity.`
- **S307 / P223**: `Its complex zeros control the reach of its Taylor expansion.`
- **S308 / P224**: `We left polynomial capacity to talk about matrices.`
- **S309 / P225**: `Capacity was already waiting inside the matrix.`

#### Why bother?

- **S310 / P226**: `The common object is small:`
- **S311 / P227**: `$$ Z(\theta)=\sum_j c_je^{\langle a_j,\theta\rangle}. $$`
- **S312 / P228**: `Change coordinates, and it is a polynomial or posynomial.`
- **S313 / P228**: `Normalize it, and it generates a probability distribution.`
- **S314 / P228**: `Differentiate its logarithm, and it gives means, covariances, and higher cumulants.`
- **S315 / P228**: `Subtract a target linear term and minimize, and it gives capacity—or the best cross-entropy in a log-linear family.`
- **S316 / P229**: `The correspondence is exact where the logits are affine in the optimized parameters, including a trainable final layer over frozen features.`
- **S317 / P229**: `It does not make end-to-end deep-network training convex.`
- **S318 / P229**: `Nor does it make every positive polynomial real stable.`
- **S319 / P230**: `What it does provide is a shared language.`
- **S320 / P231**: `**Exponent geometry tells us which means are attainable.`
- **S321 / P231**: `Entropy tells us what it costs to attain them.`
- **S322 / P231**: `Complex-zero geometry tells us how far a local series can see.**`
- **S323 / P232**: `The polynomial did not become something else.`
- **S324 / P233**: `We kept asking it different questions.`
