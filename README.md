# cwl-nf

Running Nextflow (and Makefile that runs Nextflow) from CWL

# Installation

Clone this repo:

```
git clone https://github.com/stevekm/cwl-nf.git
cd cwl-nf
```

Install dependencies:

```
make install
```

# Run Nextflow Pipeline

The demo Nextflow pipeline can be run with 

```
make nextflow-run
```

# Run Nextflow from CWL

```
make run
```

# Run the Makefile

First, enter a bash session with the installed dependencies in the environment

```
make bash
```

Run the command for the CWL pipeline:

```
cwl-runner makefile.cwl makefile-job.yaml
```

# Software

- requires Docker, bash, GNU `make`
