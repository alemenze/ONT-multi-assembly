#!/usr/bin/env nextflow
/*
                              (╯°□°)╯︵ ┻━┻

========================================================================================
                                 ONT-multi-assembly
========================================================================================
                  https://github.com/alemenze/ONT-multi-assembly
*/

nextflow.enable.dsl = 2

def helpMessage(){
    log.info"""

    Usage:
    
        nextflow run alemenze/ONT-multi-assembly \
        --samplesheet samplesheet.csv \
        -profile singularity


    Mandatory for full workflow:
        --samplesheet               CSV file with information on the samples (see example)
        -profile                    Currently available for docker (local), singularity (HPC local), slurm (HPC multi node) and GCP (requires credentials)

    Assembly parameters:
        --subset_cov                Depth to randomly subset to, integer value (IE 100 for 100X). Defaults to 100
        --genome_size               Putative (or known) genome size of organism of assembly. Defaults to 4.4mb
        --assembly_genome_size      Putative (or known) genome size of organism for assembly. Defaults to 5m

    Optional:
        --outdir                    Directory for output directories/files. Defaults to './results'   

    GCP Options:
        --google_bucket             <gs://bucket/subfolder/> to stage running files. 
        --google_preemptible        Defaults to false. You can change this to true to get better cost savings, but nodes can be taken  
        
    """

}

// Show help message
if (params.help) {
    helpMessage()
    exit 0
}


////////////////////////////////////////////////////
/* --              Parameter setup             -- */
////////////////////////////////////////////////////

////////////////////////////////////////////////////
/* --              IMPORT MODULES              -- */
////////////////////////////////////////////////////

////////////////////////////////////////////////////
/* --           RUN MAIN WORKFLOW              -- */
////////////////////////////////////////////////////

// Full workflow demultiplexing through Trycycler
workflow {
    include { Assembly_Only } from './modules/main_workflows/assembly_only'
    Assembly_Only()
}