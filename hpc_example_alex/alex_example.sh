#!/bin/bash

#SBATCH --job-name=build-apptainer

#SBATCH --ntasks=1

#SBATCH --cpus-per-task=4

#SBATCH --time=1:00:00

#SBATCH --mem=16GB

#SBATCH --output=alex_example_log%j.stdout

#SBATCH --error=alex_example_err_%j.stderr

#SBATCH --clusters=donphan


# eventually load other modules

module purge


# go to the (current) working directory (optional, if this is the

# directory where you submitted the job)

cd /tmp

mkdir /tmp/$USER



echo Start Job

date



APPTAINER_CACHEDIR=/tmp/ \

APPTAINER_TMPDIR=/tmp/ \

## apptainer build --fakeroot /tmp/$USER/fastqc-0.11.9.sif docker://biocontainers/fastqc:v0.11.9_cv8

apptainer build --fakeroot /tmp/$USER/helloworld.sif docker://hello-world:nanoserver-ltsc2025


## mv /tmp/$USER/fastqc-0.11.9.sif $VSC_SCRATCH
mv /tmp/$USER/helloworld.sif $VSC_SCRATCH



date

echo End Job



echo " "



# Creating resources report

echo "=== Report resources usage ==="

sacct -j $SLURM_JOBID  --format=jobid,partition,elapsed,state,totalcpu,maxrss,averss