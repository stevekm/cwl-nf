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

It should look like this:

```
$ make nextflow-run
nextflow run main.nf --samplesheet samplesheet.csv
N E X T F L O W  ~  version 20.01.0
Launching `main.nf` [cheesy_yalow] - revision: bc66a79949
[6d/c2d8bf] Submitted process > use_sample (2)
[cd/f2bb4f] Submitted process > some_task
[14/df7892] Submitted process > use_sample (3)
[97/255362] Submitted process > use_sample (1)
Bar
Baz
Foo
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.3 LTS"
NAME="Ubuntu"
VERSION="18.04.3 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.3 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
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
