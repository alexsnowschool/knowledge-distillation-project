#!/usr/bin/env bash
#SBATCH --job-name=cosine-sim-hlaing
#SBATCH --output=simkd%j.log
#SBATCH --error=simkd%j.err
#SBATCH --mail-user=hlaing@uni-hildesheim.de
#SBATCH --partition=STUD
#SBATCH --gres=gpu:1

cd /home/hlaing/student-research-project/alex/SimKD/       # navigate to the directory if necessary
source activate teacher
srun bash ./scripts/run_selected.sh