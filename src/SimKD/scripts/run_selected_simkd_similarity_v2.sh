#!/bin/bash

# Define an array of commands
# LR [0.01, 0.05, 0.001]
# Losses [Cosine Similarity, KL-Divergence]
commands=(
# kd
# "python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill simkd --model_s MobileNetV2_Original --loss l2 -c 0 -d 0 -b 1 --trial 0 "
# "python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill simkd --model_s MobileNetV2_Original --loss KL -c 0 -d 0 -b 1 --trial 1 "
# "python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill simkd --model_s MobileNetV2_Original --loss KL -c 0 -d 0 -b 1 --trial 0"
"python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill simkd --model_s MobileNetV2_Original --loss KL -c 0 -d 0 -b 1 --trial 0"

)

# Loop over the commands array
for cmd in "${commands[@]}"; do
  # Run the command and wait for it to finish
  echo "Running: $cmd"
  eval $cmd
  # Check if the command was successful
  if [ $? -eq 0 ]; then
    echo "Command succeeded"
  else
    echo "Command failed"
    # Exit the script or continue to the next command depending on your needs
    exit 1
  fi
done