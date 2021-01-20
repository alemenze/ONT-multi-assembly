#!/usr/bin/env nextflow
/*
                              (╯°□°)╯︵ ┻━┻

========================================================================================
                                 ONT-multi-assembly
========================================================================================
                  https://github.com/alemenze/ONY-multi-assembly
*/

nextflow.enable.dsl = 2

def helpMessage(){
    log.info"""

    Usage:
    
        
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