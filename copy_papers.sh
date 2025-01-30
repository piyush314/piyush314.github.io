#!/bin/bash

# Create the target directory if it doesn't exist
mkdir -p assets/pdf/publications

# Base source directory
SRC_DIR="/Users/7ps/Dropbox/projects/writing-projects/my_papers"

# Copy files with proper naming
# SuperLU papers
cp "$SRC_DIR/SuperLU/trisolve3d/ics82-sao.pdf" "assets/pdf/publications/sao2019ics-trisolve.pdf"
cp "$SRC_DIR/SuperLU/europar-14/main.pdf" "assets/pdf/publications/sao2014europar-solver.pdf"
cp "$SRC_DIR/SuperLU/sc23UnifiedTRsolve/main.pdf" "assets/pdf/publications/liu2023sc-trisolve.pdf"

# APSP papers
cp "$SRC_DIR/APSP/hpdc21/main.pdf" "assets/pdf/publications/sao2020hpdc-apsp.pdf"
cp "$SRC_DIR/APSP/euroMPI-2023/main.pdf" "assets/pdf/publications/lu2023eurompi-comm.pdf"
cp "$SRC_DIR/APSP/apsp3d/main.pdf" "assets/pdf/publications/sao2020ppopp-apsp.pdf"

# HDBSCAN papers
cp "$SRC_DIR/HDBSCAN/alpha-tree/pandora-icpp24.pdf" "assets/pdf/publications/sao2024icpp-pandora.pdf"
cp "$SRC_DIR/HDBSCAN/boruvka-paper/main.pdf" "assets/pdf/publications/prokopenko2022icpp-emst.pdf"

echo "Papers copied successfully!"
