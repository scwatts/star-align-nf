process STAR {
    tag "${meta.id}"
    label 'process_medium'

    container 'quay.io/biocontainers/star:2.7.3a--0'

    input:
    tuple val(meta), path(fastq_fwd), path(fastq_rev)
    path genome_star_index

    output:
    tuple val(meta), path('*bam'), emit: bam
    path 'versions.yml'          , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    """
    STAR \\
        --readFilesIn ${fastq_fwd} ${fastq_rev} \\
        --genomeDir ${genome_star_index} \\
        --runThreadN ${task.cpus} \\
        --readFilesCommand zcat \\
        --alignSJstitchMismatchNmax 5 -1 5 5 \\
        --alignSplicedMateMapLmin 35 \\
        --alignSplicedMateMapLminOverLmate 0.33 \\
        --chimJunctionOverhangMin 10 \\
        --chimOutType WithinBAM SoftClip \\
        --chimScoreDropMax 30 \\
        --chimScoreJunctionNonGTAG 0 \\
        --chimScoreMin 1 \\
        --chimScoreSeparation 1 \\
        --chimSegmentMin 10 \\
        --chimSegmentReadGapMax 3 \\
        --limitOutSJcollapsed 3000000 \\
        --outBAMcompression 0 \\
        --outFilterMatchNmin 35 \\
        --outFilterMatchNminOverLread 0.33 \\
        --outFilterMismatchNmax 3 \\
        --outFilterMultimapNmax 10 \\
        --outFilterScoreMinOverLread 0.33 \\
        --outSAMattributes All \\
        --outSAMtype BAM Unsorted \\
        --outSAMunmapped Within \\
        --runRNGseed 0

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        star: \$(STAR --version | sed -e "s/STAR_//g")
    END_VERSIONS
    """

    stub:
    """
    touch unknown.bam
    echo -e '${task.process}:\\n  stub: noversions\\n' > versions.yml
    """
}
