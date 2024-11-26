#!/usr/bin/env bash
#SBATCH --job-name=simkd_cosine
#SBATCH --output=simkd_cosine%j.log
#SBATCH --error=simkd_cosine%j.err
#SBATCH --mail-user=hlaing@uni-hildesheim.de
#SBATCH --partition=TEST
#SBATCH --gres=gpu:1

cd /home/hlaing/new/kd-srp/src/SimKD       # navigate to the directory if necessary
source activate teacher
srun bash ./scripts/run_selected_simkd_similarity_v2.sh