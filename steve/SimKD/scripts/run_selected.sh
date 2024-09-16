#!/bin/bash


# Steves testing command: 
# "python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.01 --distill simkd_mp --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 0 --gpu_id 0 --num_workers 4 --skip-validation"

# Define an array of commands
# LR [0.01, 0.05, 0.001]
# Losses [Cosine Similarity, KL-Divergence]
commands=(
# kd
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.01 --distill kd --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 0 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.05 --distill kd --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 0 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.001 --distill kd --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 0 --gpu_id 0"

"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.01 --distill kd --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 1 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.05 --distill kd --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 1 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.001 --distill kd --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 1 --gpu_id 0"

"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.01 --distill kd --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 2 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.05 --distill kd --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 2 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.001 --distill kd --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 2 --gpu_id 0"

# similarity
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.01  --distill similarity --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 0 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.05 --distill similarity --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 0 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.001 --distill similarity --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 0 --gpu_id 0"

"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.01 --distill similarity --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 1 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.05 --distill similarity --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 1 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.001 --distill similarity --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 1 --gpu_id 0"

"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.01 --distill similarity --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 2 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.05 --distill similarity --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 2 --gpu_id 0"
"python train_student.py --path_t ./save/teachers/models/resnet38x2_vanilla_cifar100_trial_1/resnet38x2_best.pth --epochs 240 --learning_rate 0.001 --distill similarity --model_s resnet8x4 -c 1 -d 1 -b 0 --trial 2 --gpu_id 0"

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