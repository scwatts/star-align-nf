workflow PREPARE_INPUT {
    take:
        ch_samplesheet

    main:
        ch_outputs = Channel.of(ch_samplesheet)
            .splitCsv(header: true)
            .map { meta ->

                // TODO(SW): additional checks

                return meta
            }

    emit:
        inputs = ch_outputs
}
