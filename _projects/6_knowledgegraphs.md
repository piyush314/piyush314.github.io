---
layout: page
title: Knowledge Graph Analytics
description: Exascale Graph Algorithms for Biomedical Discovery
importance: 6
category: research
related_publications: true
mermaid:
  enabled: true
---

## From Text to Discovery

Biomedical literature doubles every few years. Hidden within millions of papers are connections that no single researcher could find: drug A treats disease X through pathway Y, but these facts span decades of publications across disciplines. **Knowledge graph analytics makes these connections computable.**

This research develops scalable graph algorithms—particularly all-pairs shortest paths (APSP)—that power relationship discovery across massive scholarly corpora.

## Algorithm Evolution

The core insight: the algebraic equivalence between Floyd-Warshall and Gaussian elimination enables importing sparse direct solver techniques to graph shortest-path computation.

```mermaid
graph TB
    subgraph Evolution[APSP Algorithm Evolution]
        direction LR
        S1[SuperFW - PPoPP 2020]
        S2[DSNAPSHOT - SC 2020]
        S3[COAST - SC 2022]
        S1 -->|scale out| S2
        S2 -->|exascale| S3
    end

    subgraph Techniques[Sparse Solver Techniques]
        T1[Fill-reducing Ordering]
        T2[Symbolic Analysis]
        T3[Supernodal Traversal]
        T4[Elimination Tree]
    end

    Techniques --> S1

    subgraph Applications
        KG[Knowledge Graphs]
        BM[Biomedical Mining]
        DR[Drug Discovery]
    end

    S3 --> Applications

    style Evolution fill:#f0f7ff,stroke:#1a73e8,stroke-width:2px
    style Techniques fill:#e6f4ea,stroke:#137333
    style Applications fill:#fce8e6,stroke:#d93025
```

### SuperFW: Supernodal APSP (PPoPP 2020)

Applies sparse Cholesky-style techniques to APSP. Vertices with similar adjacency structure are grouped into supernodes, enabling blocked operations that improve cache locality. Achieves **50× speedup** over baselines for several graph classes.

### DSNAPSHOT: 136 Petaflop/s (SC 2020)

GPU-accelerated, distributed-memory Floyd-Warshall on Summit. Operating in the tropical semiring (min-plus algebra), achieved **136 petaflop/s** at 90% parallel efficiency on 4,096 nodes (24,576 GPUs).

### COAST: First Exaflop Graph Algorithm (SC 2022)

Extended to Frontier's AMD GPUs, achieving **1.004 exaflop/s**—the first graph AI algorithm to surpass one exaflop. **Gordon Bell Prize Finalist.**

## Biomedical Applications

Applied to COVID-19 Open Research Dataset (CORD-19) and the SPOKE biomedical knowledge network for:

- Drug repurposing candidates
- Treatment pathway discovery
- Cross-discipline hypothesis generation

## Technology Transfer

**US Patent 12,417,246**: _Knowledge graph analytics kernels in high performance computing_ (2025)

The algorithms developed here have been patented and transitioned to production use, enabling real-world biomedical discovery.

## Key Publications

- P. Sao, R. Kannan, P. Gera, R. Vuduc. _A Supernodal All-Pairs Shortest Path Algorithm._ PPoPP 2020. **SIAM PP22 Best Paper Prize** {% cite sao2020supernodal %}.
- R. Kannan, P. Sao, H. Lu, et al. _Scalable Knowledge Graph Analytics at 136 Petaflop/s._ SC 2020. **Gordon Bell Finalist** {% cite kannan2020scalable %}.
- R. Kannan, P. Sao, H. Lu, et al. _Exaflops Biomedical Knowledge Graph Analytics._ SC 2022. **Gordon Bell Finalist** {% cite kannan2022exaflops %}.
