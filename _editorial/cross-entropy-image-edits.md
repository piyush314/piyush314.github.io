# Blog illustration edits

Corrected copies of the three user-supplied illustrations, created with the built-in image generation tool. The originals in Downloads were preserved. The copies retain the supplied layout and visual style; the corrections align the equations, labels, and schematic plots with the blog post.

## Integration and verification

- Capacity illustration: Section 5, after the three target means are interpreted geometrically.
- Trace-power illustration: Section 7, after the spectral curve and estimator are explained.
- Complex-zero illustration: Section 8, after the common two-term zero calculation.
- Each figure has descriptive alt text, a caption, lazy loading, explicit dimensions to reserve its space, and click-to-enlarge behavior. The existing site build generates 480-, 800-, and 1400-pixel WebP variants.
- A small style override on this post keeps enlarged figures above the fixed navigation bar.
- The Jekyll draft build succeeds. All three images load in the browser preview; zoom was exercised, and the mathematical expressions in the article still render without MathJax errors.

## capacity-geometry

- Original: `/Users/7ps/Downloads/ChatGPT Image Sep 16, 2026, 12_18_28 AM (2).png`
- Saved copy: `/Users/7ps/Dropbox/projects/Periodic-WebCVBlogNews/piyush314.github.io/assets/img/cross-entropy/capacity-geometry.png`
- Mode: built-in imagegen edit.

### Exact editing prompt

Use case: precise-object-edit, scientific infographic corrections.
Image 1 is the EDIT TARGET, an existing infographic "Capacity and the Geometry of Training" to be included in a mathematics blog.
Preserve the title, landscape aspect ratio, navy serif typography, pastel panel palette, all panel arrangement and visual style. Keep the overall artwork and correctly printed mathematics. Make these specific scientific corrections, with legible typeset math and no extra invented text:

1. In the left column and exponential tilting formula, rename coefficient symbols a_0,a_1,a_2,a_i to c_0,c_1,c_2,c_i throughout. Values c_0=3,c_1=5,c_2=2. Exponents remain 0,1,2. The left coefficient bar plot must show heights 3 at exponent 0, 5 at exponent 1 (tallest), and 2 at exponent 2 (shortest). Add tiny value labels 3,5,2 above the correct bars.
2. The theta=0 distribution plot in the exponential tilting panel must show probabilities 0.3,0.5,0.2 at 0,1,2 respectively, with middle highest and right lowest. The theta→−∞ and theta→+∞ plots show exactly unit mass at 0 and 2 respectively, the other bars have zero height.
3. Replace heading "Dual formulation" with "Log-coordinate form". Preserve log cap*alpha(P)=inf*{theta in R}[A(theta)-alpha theta], A=log Z, Z=3+5e^theta+2e^(2theta). This is a coordinate transformation, not the entropy dual.
4. In the capacity panel replace the small explanatory paragraph with: "Capacity is the infimum of P(x)/x^alpha over x>0."
5. Replace the bottom geometric-picture explanatory paragraph with: "Finite tilts attain means in (0,2). Boundary means 0 and 2 are approached as the tilt tends to infinity in either direction. The closed convex hull is [0,2]."
6. Correct the typo "batches" to "chooses" in the sentence beneath the log-coordinate formula.
   Everything else remains consistent: alpha=1 finite optimum, alpha=2 boundary as theta→+∞, alpha=3 impossible and capacity=0. Preserve the correct mean-matching equation. Do not introduce new decorative elements.

## trace-powers-log-determinants

- Original: `/Users/7ps/Downloads/ChatGPT Image Sep 16, 2026, 12_18_29 AM (3).png`
- Saved copy: `/Users/7ps/Dropbox/projects/Periodic-WebCVBlogNews/piyush314.github.io/assets/img/cross-entropy/trace-powers-log-determinants.png`
- Mode: built-in imagegen edit.

### Exact editing prompt

Use case: precise-object-edit, scientific infographic corrections.
Image 1 is the EDIT TARGET "Trace Powers vs. Log-Determinants" for a mathematics blog.
Preserve the existing landscape aspect ratio, title, trench-coat illustration, navy serif typography, pastel panel composition, all correct equations and main layout. Change only these scientific details:

1. In the lower-right cumulant-generating-function panel, redraw K(t)=log M(t) as a convex curve with K(0)=0 and K(1)=0, STRICTLY BELOW the horizontal axis for 0<t<1, then rising above zero after t=1. Mark horizontal-axis ticks 0 and 1. The tangent at t=0 must slope DOWNWARDS to the right, labeled K'(0)=E[log X]≤0. Remove the incorrect positive-slope tangent. Leave adequate room below the horizontal axis for the dip. The positive curvature and negative initial slope should be unmistakable.
2. The four top eigenvalue-contribution plots depict RELATIVE contributions, not a fixed absolute scale: add a compact label above them "Relative contributions: λ_i^k / tr(B^k)" and keep the existing trace-power formulas below. Add "when λ_1>λ_2" next to the large-k approximation tr(B^k)≈λ_1^k so multiplicity is not overlooked.
3. Clean up the big summation symbols at the top trace-power formula and middle log-determinant formula. They must simply be ∑ from i=1 to n with no stray duplicate limits, apostrophes, or marks.
4. Maintain the exact bottom identities for B_epsilon=diag(epsilon,1,...,1): tr(B_epsilon^k)=epsilon^k+(n−1), log det B_epsilon=log epsilon. Preserve the normalized-spectrum definitions mu=tr(B)/n, X=lambda/mu, M(t)=E[X^t]=(1/n)∑(lambda_i/mu)^t and log det B=n(log mu+K'(0)).
   Keep all other art, colors and text unchanged, with crisp readable mathematics.

## complex-zeros-softmax

- Original: `/Users/7ps/Downloads/ChatGPT Image Sep 16, 2026, 12_18_29 AM (4).png`
- Saved copy: `/Users/7ps/Dropbox/projects/Periodic-WebCVBlogNews/piyush314.github.io/assets/img/cross-entropy/complex-zeros-softmax.png`
- Mode: built-in imagegen edit.

### Exact editing prompt

Use case: precise-object-edit, scientific infographic corrections.
Image 1 is the EDIT TARGET "Complex Zeros and the Ghosts of Softmax" for a mathematics blog.
Preserve the title, landscape aspect ratio, navy serif typography, pastel panels, exponential plot, cute ghost motifs, correctly printed main zero and radius formulas, and overall composition. Make only these scientific corrections:

1. The bottom-left binary softmax panel must say "denominator zeros; poles of σ(t)" before the equation "1+e^t=0 ⇒ t=(2m+1)iπ". These are not zeros of the sigmoid σ(t)=e^t/(1+e^t).
2. In the bottom middle two-point spectral/Gibbs panel, for Z(β)=u e^(−βE_1)+v e^(−βE_2), correct the zero formula to β_m=[log(v/u)+(2m+1)iπ]/(E_2−E_1). The numerator is log(v/u), NOT log(u/v), with this denominator.
3. Make the main complex-plane plot consistent with the GENERAL formula t*m=[log(u/v)+(2m+1)iπ]/(b−a). Draw its vertical ghost lattice to the RIGHT of the imaginary axis on a dotted vertical line at Re(t)=log(u/v)/(b−a), with a small label "schematic: u>v, b>a". The closest upper zero is t_0 at imaginary part +π/(b−a); its nearest lower counterpart is t*{−1} at −π/(b−a). Label farther upper zero t*1 and farther lower zero t*{−2}. Draw the dashed convergence circle centered at the origin passing through the two closest zeros, and the radius R from origin to t_0. Keep Re(t) and Im(t) axes clear. Keep the radius formula R=sqrt(log²(u/v)+π²)/|b−a|.
4. Label the radius "Taylor radius of log F about 0" so it is not confused with the Taylor radius of F itself. F is entire.
   Do not change the correct positivity statement on the real line or add any claim that the radius guarantees a safe optimizer step. Preserve legibility and all other artwork.
