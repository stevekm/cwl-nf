#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [make, nextflow-run]
inputs:
  makefile:
    type: File
    inputBinding:
      position: 1
      prefix: --makefile
outputs:
  output_dir:
    type: File
    outputBinding:
      glob: output
