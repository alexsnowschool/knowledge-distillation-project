# First presentation general notes

## Main talking points given by Diego

* Problem
* Dataset
* Literature survey
* Idea formalized
* Experiments planned
* First experiments results

### Problem
* General introduciton to knowledge destillation (https://neptune.ai/blog/knowledge-distillation) (Use Images from here)
* We can also re-use a lot of what we wrote in the proposal (https://www.overleaf.com/project/65c4ecfb902e78e0d223f51b)
* Goal is to use a bigger model to increase performance of a smaller model 
* Base case: Align the outputs of the final classificaiton layer of teacher and student model


### Literature Survey
* Response-based knowledge, Feature-based knowledge, and Relation-based knowledge
* Online-, offline-, self-destillation
* What are the specifics of our base paper (https://arxiv.org/pdf/2203.14001)
    * (i.e. feature-based, offline, ...)
    * Align deep features before the classification layer
    * Use projector to align feature dimensions
    * Re-using the classification layer of the teacher

### Dataset
* Cifar-10 and Cifar-100

### Idea formalized

### Experiments planned
* Different loss functions
    * Base paper only uses MSE
    * We also want to try: $l_1$, $l_2$, $l_\infty$, Cosine similarity, Kullback–Leibler divergence
* Multiple projectors
    * Aligning features in earlier layers
* Ablation studies
    * Try different:
        * projector architectures
            * Show what paper tried and what we want to try 
            * Try Linear Projectors too (Only for the last projector)
        * losses at different projectors and how to weigh them (earlier vs. later)
        * Downscaling the teacher instead of upscaling the student or meet inbetween


### First experiment results