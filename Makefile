SHELL:=/bin/bash
UNAME:=$(shell uname)
MACHINE:=$(shell uname -m)
export PATH:=$(CURDIR)/conda/bin:$(PATH)
export NXF_VER:=20.01.0
export NXF_ANSI_LOG=false
unexport PYTHONPATH
unexport PYTHONHOME
export CONDA_PREFIX:=$(CURDIR)/conda
export JAVA_HOME=$(CONDA_PREFIX)

ifeq ($(UNAME), Darwin)
CONDASH:=Miniconda3-4.5.4-MacOSX-x86_64.sh
export JAVA_LD_LIBRARY_PATH=$(JAVA_HOME)/jre/lib/server
endif

ifeq ($(UNAME), Linux)
CONDASH:=Miniconda3-4.5.4-Linux-x86_64.sh

ifeq ($(MACHINE), x86_64)
export JAVA_LD_LIBRARY_PATH=$(JAVA_HOME)/jre/lib/amd64/server
else
export JAVA_LD_LIBRARY_PATH=$(JAVA_HOME)/jre/lib/i386/server
endif

endif

CONDAURL:=https://repo.continuum.io/miniconda/$(CONDASH)

conda:
	@echo ">>> Setting up conda..."
	@wget "$(CONDAURL)" && \
	bash "$(CONDASH)" -b -p conda && \
	rm -f "$(CONDASH)"

install: conda
	pip install cwlref-runner
	conda install -y bioconda::nextflow=20.01.0

bash:
	bash

run:
	cwl-runner nextflow.cwl nextflow-job.yaml

nextflow-run:
	nextflow run main.nf --samplesheet samplesheet.csv

clean:
	rm -rf output
	rm -f .nextflow.log*
	rm -rf .nextflow*
	rm -rf work
	rm -f *.html*
	rm -f trace.txt*
	rm -f dag.*
