//
// This file holds several functions specific to the workflow/star_align.nf in the umccr/star-align-nf pipeline
//

import nextflow.Nextflow
import groovy.text.SimpleTemplateEngine

class WorkflowStarAlignment {

    //
    // Check and validate parameters
    //
    public static void initialise(params, log) {
        if (!params.containsKey('star_index_path')) {
            log.error "STAR index is required: --star_index_path /path/to/star_index/ or " +
                "defining star_index_path in a detectable config file."
        }
    }
}
