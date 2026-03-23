---
layout: page
title: Knowledge Graph Analytics
description: Exascale Graph Algorithms for Biomedical Discovery
importance: 6
category: research
related_publications: true
---

## From Text to Discovery

Biomedical literature doubles every few years. Hidden within millions of papers are connections that no single researcher could find: drug A treats disease X through pathway Y, but these facts span decades of publications across disciplines. **Knowledge graph analytics makes these connections computable.**

This research develops scalable graph algorithms—particularly all-pairs shortest paths (APSP)—that power relationship discovery across massive scholarly corpora.

## Algorithm Evolution

The core insight: the algebraic equivalence between Floyd-Warshall and Gaussian elimination enables importing sparse direct solver techniques to graph shortest-path computation.

```mermaid
graph TB
    subgraph Evolution["APSP Algorithm Evolution"]
        direction LR

        S1["<b>SuperFW</b><br/>Supernodal APSP<br/><i>PPoPP 2020</i><br/>Shared memory"]
        S2["<b>DSNAPSHOT</b><br/>Distributed Semiring<br/>APSP<br/><i>SC 2020</i><br/>136 PF/s on Summit"]
        S3["<b>COAST</b><br/>Exascale Comm-<br/>Optimized APSP<br/><i>SC 2022</i><br/>1.004 EF/s on Frontier"]

        S1 -->|"scale out<br/>+ GPU accel."| S2
        S2 -->|"exascale<br/>optimization"| S3
    end

    subgraph Techniques["Techniques from Sparse Direct Solvers"]
        T1["Fill-reducing<br/>Ordering"]
        T2["Symbolic<br/>Analysis"]
        T3["Supernodal<br/>Traversal"]
        T4["Elimination Tree<br/>Parallelism"]
    end

    Techniques --> S1

    subgraph Applications["Applications"]
        KG["Knowledge Graph<br/>Analytics"]
        BM["Biomedical Literature<br/>Mining (CORD-19)"]
        DR["Drug Repurposing<br/>& Discovery"]
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

**US Patent 12,417,246**: *Knowledge graph analytics kernels in high performance computing* (2025)

The algorithms developed here have been patented and transitioned to production use, enabling real-world biomedical discovery.

## Key Publications

- P. Sao, R. Kannan, P. Gera, R. Vuduc. *A Supernodal All-Pairs Shortest Path Algorithm.* PPoPP 2020. **SIAM PP22 Best Paper Prize**
- R. Kannan, P. Sao, H. Lu, et al. *Scalable Knowledge Graph Analytics at 136 Petaflop/s.* SC 2020. **Gordon Bell Finalist**
- R. Kannan, P. Sao, H. Lu, et al. *Exaflops Biomedical Knowledge Graph Analytics.* SC 2022. **Gordon Bell Finalist**
