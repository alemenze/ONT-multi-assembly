#!/usr/bin/env nextflow

// Specify DSL2
nextflow.enable.dsl=2

// Process definition
process quast {
    tag "${meta}"

    publishDir "${params.outdir}/quast/${replicate}/${type}",
        mode: "copy",
        overwrite: true,
        saveAs: { filename -> filename }

    container "staphb/quast:5.0.2"

    input:
        tuple val(meta), path(reads)
        val(replicate)
        val(type)
    
    output:
        path("${meta}*"), emit: qc

    script:
        """
        quast.py -o $meta -b --circos $reads
        """

}