#!/usr/bin/env -S bash -l

## TODO: understand what we have to put here
#SBATCH --account-vibrepdata_3

## ask as few tasks per node as needed
#SBATCH --nodes=1 --tasks-per-node=1 --cpus-per-task=4 

## log output
#SBATCH --output=build-recipe.stdout

#SBATCH --time=2:00:00

#SBATCH --mem 16G

## go to specific cluster environment
module swap cluster/doduo

git clone matsanches/repo-name.git ##might create problems
apptainer build -B /mnt/c/Users/lotte.pohl/OneDrive - VLIZ/Documents/repositories/project_docker_microcredential:/bash_exercise/ Dockerfile.train

CHANGEDIR repo-name

apptainer build Dockerfile.train

## instructions for lotte on HPC
## cd $VSC_SCRATCH
## go to scratch folder on HPC and put bash script there, then run it with sbatch bashscript_hpc.sh

## https://status.vscentrum.be/tier2_gent.html#incident_0137