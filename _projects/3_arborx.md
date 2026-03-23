---
layout: page
title: ArborX
description: Performance-Portable Spatial Search and Clustering
importance: 3
category: software
related_publications: true
mermaid:
  enabled: true
---

## The Spatial Search Problem

Many scientific applications—from cosmology simulations to wind farm modeling—need to answer geometric queries at massive scale: *Which particles are within distance r? What are the k nearest neighbors?* Traditional spatial data structures don't map well to GPUs, where irregular memory access patterns kill performance.

[ArborX](https://github.com/arborx/ArborX) is an open-source C++ library providing performance-portable algorithms for geometric search on modern supercomputing architectures. Developed as part of the Exascale Computing Project (ECP), it uses Kokkos for device-independent parallelism, enabling efficient execution across CPUs and GPUs from multiple vendors using a single codebase.

## Architecture

At its core, ArborX uses a linear bounding volume hierarchy (BVH) for low construction cost and high-quality spatial indexing. It supports both spatial queries and nearest-neighbor queries, each requiring fundamentally different tree traversal strategies.

```mermaid
graph TB
    subgraph ArborX["ArborX Library"]
        direction TB

        BVH["<b>Bounding Volume Hierarchy</b><br/>Linear BVH construction<br/>Morton-code sorting"]

        subgraph Queries["Query Types"]
            SQ["Spatial Queries<br/><i>radius-based search</i>"]
            NQ["Nearest-Neighbor<br/><i>k-closest objects</i>"]
        end

        subgraph Algorithms["Algorithms Built on ArborX"]
            DBSCAN["DBSCAN<br/>Clustering"]
            EMST["Euclidean Minimum<br/>Spanning Tree"]
            HDBSCAN["HDBSCAN*<br/>Clustering"]
            PANDORA["PANDORA<br/>Dendrogram<br/>Construction"]
            MLS["Moving Least<br/>Squares Interpolation"]
        end
    end

    BVH --> SQ
    BVH --> NQ
    SQ --> Algorithms
    NQ --> Algorithms

    subgraph Portability["Performance Portability via Kokkos"]
        CPU["Multi-core CPUs<br/>(OpenMP)"]
        NGPU["NVIDIA GPUs<br/>(CUDA)"]
        AGPU["AMD GPUs<br/>(HIP)"]
        IGPU["Intel GPUs<br/>(SYCL)"]
    end

    ArborX --> Portability

    style ArborX fill:#f0f7ff,stroke:#1a73e8,stroke-width:2px
    style Algorithms fill:#e6f4ea,stroke:#137333
    style Portability fill:#fef7e0,stroke:#e37400
```

## My Contributions

### Single-Tree Borůvka EMST (ICPP 2022)

Computing the Euclidean Minimum Spanning Tree on GPUs is challenging due to complex branching, data dependencies, and load imbalances. Our single-tree Borůvka algorithm addresses these challenges through careful work distribution and ArborX's spatial primitives.

### PANDORA: Parallel Dendrogram Construction (ICPP 2024)

Single-linkage clustering requires building a dendrogram—a hierarchical tree of cluster merges. PANDORA constructs this structure in parallel on GPUs, leveraging ArborX's nearest-neighbor queries to achieve scalable hierarchical clustering.

### DBSCAN for Cosmology (ExaSky)

The DBSCAN clustering algorithm we developed in ArborX performs **15× better on a single GPU** than the multithreaded CPU version on a full Summit node, directly benefiting the ECP ExaSky cosmology project.

## Impact

ArborX is published in ACM TOMS (2020) and is an integral component of xSDK and the broader ECP software ecosystem. Applications include:
- Computational cosmology (halo finding)
- Multiphysics data transfer
- Computational mechanics
- Wind farm simulations

**Code:** [github.com/arborx/ArborX](https://github.com/arborx/ArborX)
