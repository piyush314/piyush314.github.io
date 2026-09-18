// STIX Two Math for posts that opt into mathjax_font: stix2.
// MathJax 4 supplies the font metrics needed for correct equation layout.
window.MathJax = {
  tex: {
    tags: "ams",
    inlineMath: [
      ["$", "$"],
      ["\\(", "\\)"],
    ],
  },
  output: {
    font: "mathjax-stix2",
    fontPath: "https://cdn.jsdelivr.net/npm/@mathjax/%%FONT%%-font@4.0.0",
  },
};
