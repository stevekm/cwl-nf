params.samplesheet = "samplesheet.csv"

samples = Channel.fromPath( file("${params.samplesheet}") )
    .splitCsv(header: true, sep: ',')
    .map{ row ->
        def sampleID = row['SampleID']

        return sampleID
    }

process use_sample {
    echo true
    publishDir "output"

    input:
    val(sampleID) from samples

    output:
    file("${output_file}")

    script:
    output_file = "${sampleID}.txt"
    """
    echo "${sampleID}"
    touch "${output_file}"
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
