#!/usr/bin/env bash
#SBATCH --job-name=sim-hlaing
#SBATCH --output=simkd%j.log
#SBATCH --error=simkd%j.err
#SBATCH --mail-user=hlaing@uni-hildesheim.de
#SBATCH --partition=TEST
#SBATCH --gres=gpu:1

cd /home/hlaing/new/kd-srp/src/SimKD       # navigate to the directory if necessary
source activate teacher
srun bash ./scripts/run_selected.sh