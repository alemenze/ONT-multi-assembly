# ONT-multi-assembly
![GitHub last commit](https://img.shields.io/github/last-commit/alemenze/trycycler-workflow)
[![Nextflow](https://img.shields.io/badge/nextflow%20DSL2-%E2%89%A520.11.0--edge-23aa62.svg?labelColor=000000)](https://www.nextflow.io/)
[![run with docker](https://img.shields.io/badge/run%20with-docker-0db7ed?labelColor=000000&logo=docker)](https://www.docker.com/)
[![run with singularity](https://img.shields.io/badge/run%20with-singularity-1d355c.svg?labelColor=000000)](https://sylabs.io/docs/)
[![run with GCP](https://img.shields.io/badge/run%20with-GCP-ffff00.svg?labelColor=000000&logo=googlecloud)](https://cloud.google.com/)
[![run with slurm](https://img.shields.io/badge/run%20with-slurm-ff4d4d.svg?labelColor=000000)](https://slurm.schedmd.com/)

## Description
This workflow is built to provide a multi-assembly approach for Oxford Nanopore based projects. 

## Summary Features:
- Random subsampling of reads for multiple assemblies with [Rasusa](https://github.com/mbhall88/rasusa)
- Replicate assembly with [Flye](https://github.com/fenderglass/Flye), [Canu](https://github.com/marbl/canu), and [Miniasm/minimap2](https://github.com/lh3/miniasm)
- Assembly QC with [Quast](http://bioinf.spbau.ru/quast)

## Example Commands
### Slurm HPC execution
```
nohup ./nextflow -bg run alemenze/ONT-multi-assembly --samplesheet sample_metadata.csv --outdir ./assemblies -profile slurm > assemblies.txt
```