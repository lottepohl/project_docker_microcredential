#!/usr/bin/env -S bash -l

# name job
#SBATCH --job-name=RDA-containers-project

# define logfile
#SBATCH --output=log_docker_RDA_%j.stdout
# define errorile
#SBATCH --error=err_docker_RDA_%j.stderr

# define resources
#SBATCH --nodes=1 --tasks-per-node=1 --cpus-per-task=4

#SBATCH --time=0:30:00

#SBATCH --mem=16G

# sett cluster
module swap cluster/donphan


# pull the dockerhub image
apptainer pull image_train.sif docker://lottepohl/project_docker_microcredential_lp_ms:train_image
