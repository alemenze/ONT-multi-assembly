#!/usr/bin/env nextflow

// Specify DSL2
nextflow.enable.dsl=2

// Process definition
process canu_assembly {
    tag "${meta}"

    if (!workflow.profile=='google' && !workflow.profile=='slurm'){
        maxForks 1
    }

    publishDir "${params.outdir}/${meta}/canu/${replicate}",
        mode: "copy",
        overwrite: true,
        saveAs: { filename -> filename }

    container "alemenze/canu-docker"

    input:
        tuple val(meta), path(reads)
        val(replicate)
    
    output:
        tuple val(meta), path("${meta}_canu/*.contigs.fasta"), emit: assembly
        tuple val(meta), path("${meta}_canu/*.gfa"), emit: gfa

    script:
        """
        canu -p ${meta} -d ${meta}_canu genomeSize=${params.assembly_genome_size} useGrid=false -nanopore-raw $reads \
            maxThreads=38 merylMemory=185G merylThreads=38 hapThreads=38 batMemory=185G redMemory=185G \
            redThreads=38 oeaMemory=185G oeaThreads=38 corMemory=185G corThreads=38
        """

}