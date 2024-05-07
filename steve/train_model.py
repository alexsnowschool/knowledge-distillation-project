import torch
import torchvision
import pickle
import os
from pathlib import Path

from utils import train, test, freeze_layers



data_path = os.path.join(Path.cwd().parent, 'data')


cifar10_train = torchvision.datasets.CIFAR10(data_path, download=True, train=True, transform=torchvision.transforms.ToTensor())
cifar10_test = torchvision.datasets.CIFAR10(data_path, download=True, train=False, transform=torchvision.transforms.ToTensor())

train_dataloader = torch.utils.data.DataLoader(cifar10_train,
                                          batch_size=128,
                                          shuffle=True)
test_dataloader = torch.utils.data.DataLoader(cifar10_test,
                                          batch_size=128,
                                          shuffle=True)


device = (
    "cuda"
    if torch.cuda.is_available()
    else "mps"
    if torch.backends.mps.is_available()
    else "cpu"
)
print(f"Using {device} device")


model = torch.hub.load('pytorch/vision:v0.10.0', 'wide_resnet50_2', weights='Wide_ResNet50_2_Weights.IMAGENET1K_V1').to(device)

freeze_layers(model, num_flex_layers=30) 


loss_fn = torch.nn.CrossEntropyLoss()

optimizer = torch.optim.Adam(model.parameters())


epochs = 5
for t in range(epochs):
    print(f"Epoch {t+1}\n-------------------------------")
    train(train_dataloader, model, loss_fn, optimizer, device)
    test(test_dataloader, model, loss_fn, device)
print("Done!")