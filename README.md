## Introduction

**umccr/star-align-nf** is a lightweight pipeline for WTS read align required for the Hartwig workflow.

## Usage

```bash
nextflow run umccr/star-align-nf \
    -profie docker \
    --input samplesheet.csv \
    --star_index_path \
    --outdir output/
```
