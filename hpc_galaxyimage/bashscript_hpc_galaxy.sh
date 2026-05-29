#!/usr/bin/env -S bash -l

# name job
#SBATCH --job-name=RDA-containers-project

# define logfile
#SBATCH --output=log_galaxy_RDA_%j.stdout
# define errorile
#SBATCH --error=err_galaxy_RDA_%j.stderr

# define resources
#SBATCH --nodes=1 --tasks-per-node=1 --cpus-per-task=4

#SBATCH --time=0:30:00

#SBATCH --mem=16G

# set cluster
module swap cluster/donphan

# pull the galaxyproject image
apptainer pull galaxy_image.sif https://depot.galaxyproject.org/singularity/aria2:1.36.0
