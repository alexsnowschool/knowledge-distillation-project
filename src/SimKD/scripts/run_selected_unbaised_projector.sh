#!/bin/bash

# Define an array of commands
# LR [0.01, 0.05, 0.001]
# Losses [Cosine Similarity, KL-Divergence]
commands=(
# unb_proj with labels
"python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill unb_proj --model_s MobileNetV2_1_0 -c 0 -d 0 -b 1 --trial 0 --use_labels --loss KL"
"python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill unb_proj --model_s MobileNetV2_1_0 -c 0 -d 0 -b 1  --trial 0 --use_labels --loss  l2"
"python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill unb_proj --model_s MobileNetV2_1_0 -c 1 -d 1 -b 1  --trial 0 --use_labels "

"python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill unb_proj --model_s MobileNetV2_1_0 -c 1 -d 1 -b 1 --trial 1 --use_labels --loss  KL"
"python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill unb_proj --model_s MobileNetV2_1_0 -c 1 -d 1 -b 1 --trial 1 --use_labels --loss  l2"
"python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill unb_proj --model_s MobileNetV2_1_0 -c 1 -d 1 -b 1 --trial 1 "

"python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill unb_proj --model_s MobileNetV2_1_0 -c 1 -d 1 -b 0 --trial 2 --use_labels --loss  KL"
"python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill unb_proj --model_s MobileNetV2_1_0 -c 1 -d 1 -b 0 --trial 2 --use_labels --loss  l2"
"python train_student.py --path_t ../../experiment_artifacts/saved_model_artifacts/teachers/models/resnet32x4_vanilla_cifar100/resnet32x4_best.pth --epochs 240 --learning_rate 0.01 --distill unb_proj --model_s MobileNetV2_1_0 -c 1 -d 1 -b 0 --trial 2 "
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