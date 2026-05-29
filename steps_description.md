# Containers project
## Microcredential Reproducible Data Analysis

*May 28, 2026*
Matilde and Lotte

> About: This Document outlines the steps we undertook to carry out the containers project in a team of two, mentioning who was leading which task, and how we collaborated.

# 1. Preparations

Matilde cloned the repository containing the project task into her personal github

# 2. Containerising the machine learning model
Matilde worked on the containerisation of the train.py and server.py, and she ran the docker containers.

Then the two of us met up to work on the project together, and Lotte reproduced the containerisation on her laptop.

# 3. Pushing docker images to dockerhub

Lotte created a [repository on dockerhub](https://hub.docker.com/repository/docker/lottepohl/project_docker_microcredential_lp_ms/tags) and both each pushed one image (train and serve).

# 4. Uploading the Dockerfiles to github

Matilde created a [[new repository](https://github.com/MatSanches/Containers_project_Lotte_and_Matilde)] on her github where she uploaded the dockerfiles that the images uploaded to dockerhub were created upon.

# 5. Building an apptainer image on the VSC

Lotte and Matilde created a first version of a bash script (file 'bashscript_hpc_old.sh') to run on the VSC but the VSC was down when we were working on the project together (there was security mitigation from 18 to 20 May, 2026), so we could not do the HPC project part together.

Lotte took over and created/ran several bash scripts, but was not able to pull from dockerhub and create an apptainer image from there.
The reason, after sending an email to the hpc admin of ugent, was additional security layers that needed to be applied resulting from the security leak the week prior. 

# 6. Explanation of the work on the VSC

After logging in via https://login.hpc.ugent.be, Lotte selected the cluster 'RHEL9 Login node Shell Access' from the dashboard and changed to the scratch folder via `cd $VSC_SCRATCH`.

On scratch, she created a new bash script with `vi bashscript_hpc.sh`. In the vim editor, she copy pasted the script contents from this repository, via I, CTRL V, and ESC :wq. Then she checked the module via `module avail cluster`, and submitted the job via `sbatch bashscript_hpc.sh`. She checked the job's status via `squeue`. 

