params.samplesheet = "samplesheet.csv"

samples = Channel.fromPath( file("${params.samplesheet}") )
    .splitCsv(header: true, sep: ',')
    .map{ row ->
        def sampleID = row['SampleID']

        return sampleID
    }

process use_sample {
    echo true

    input:
    val(sampleID) from samples

    script:
    """
    echo "${sampleID}"
    """
}

process some_task {
    echo true
    container "ubuntu:18.04"

    script:
    """
    cat /etc/*release
    """
}
