#!/usr/bin/env bash
#SBATCH --job-name=multiple_projector
#SBATCH --output=simkd_multiple_projector%j.log
#SBATCH --error=simkd_multiple_projector%j.err
#SBATCH --mail-user=hlaing@uni-hildesheim.de
#SBATCH --partition=STUD
#SBATCH --gres=gpu:1

cd /home/hlaing/new/kd-srp/src/SimKD       # navigate to the directory if necessary
source activate teacher
srun bash ./scripts/run_selected_multiple_projector.sh