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
outputs:
  output_dir:
    type: File
    outputBinding:
      glob: output
