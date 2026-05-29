#!/bin/bash

#SBATCH --job-name=build-apptainer
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=1:00:00
#SBATCH --mem=16GB
#SBATCH --output=log_mwe_docker_helloworld%j.stdout
#SBATCH --error=err_mwe_docker_helloworld%j.stderr

module purge

cd /tmp
mkdir -p /tmp/$USER

echo Start Job
date

APPTAINER_CACHEDIR=/tmp/ APPTAINER_TMPDIR=/tmp/ apptainer build --fakeroot /tmp/$USER/helloworld.sif docker://hello-world:latest

mv /tmp/$USER/helloworld.sif $VSC_SCRATCH

date
echo End Job

echo "=== Report resources usage ==="
sacct -j $SLURM_JOBID --format=jobid,partition,elapsed,state,totalcpu,maxrss,averss