#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

////////////////////////////////////////////////////
/* --              Parameter setup             -- */
////////////////////////////////////////////////////
if (params.samplesheet) {file(params.samplesheet, checkIfExists: true)} else { exit 1, 'Samplesheet file not specified!'}

Channel
    .fromPath(params.samplesheet)
    .splitCsv(header:true)
    .map{ row -> tuple(row.sample_id, file(row.ont_path))}
    .set { sample_reads }

////////////////////////////////////////////////////
/* --              IMPORT MODULES              -- */
////////////////////////////////////////////////////

include { Assemblies } from '../subworkflows/assemblies'
include { Assemblies as Assemblies_rep2 } from '../subworkflows/assemblies'
include { Assemblies as Assemblies_rep3 } from '../subworkflows/assemblies'

////////////////////////////////////////////////////
/* --           RUN MAIN WORKFLOW              -- */
////////////////////////////////////////////////////

workflow Assembly_Only {
    Assemblies(
        sample_reads,
        'Replicate1'
    )

    Assemblies_rep2(
        sample_reads,
        'Replicate2'
    )

    Assemblies_rep3(
        sample_reads,
        'Replicate3'
    )
}

