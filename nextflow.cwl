#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [nextflow, run]
inputs:
  pipeline:
    type: File
    inputBinding:
      position: 1
  samplesheet:
    type: File
    inputBinding:
      position: 1
      prefix: --samplesheet
  nextflow_config:
    type: File
outputs:
  output_dir:
    type: Directory
    outputBinding:
      glob: output
