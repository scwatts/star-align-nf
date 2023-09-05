## Introduction

**scwatts/star-align-nf** is a lightweight pipeline for WTS read alignment required for the Hartwig workflow.

## Table of contents

* [Requirements](#requirements)
* [Usage](#usage)

## Requirements

* Java
* Nextflow ≥22.10.6
* Docker

## Usage

```bash
nextflow run scwatts/star-align-nf \
    -profile docker \
    --input samplesheet.csv \
    --star_index_path star_genome_index/ \
    --outdir output/
```
