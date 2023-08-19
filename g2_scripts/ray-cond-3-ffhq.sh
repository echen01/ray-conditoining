#!/bin/bash

#SBATCH -J FFHQ3                           # Job name
#SBATCH -o FFHQ3.o                              # Name of stdout output file (%j expands to jobId)
#SBATCH -e FFHQ3.o                              # Name of stderr output file (%j expands to jobId)
#SBATCH -N 1                                            # Total number of nodes (physical machine) requested 
#SBATCH -n 6                                            # Number of cores requested
#SBATCH --mem=30000                                     # Memory pool (MB)
#SBATCH -t 96:00:00                                     # Run time (hh:mm:ss) 
#SBATCH --partition=davis
#SBATCH --gres=gpu:a6000:2                         # gpu:gpu_type:how_many_gpu

# below is the script that specifies all the commands to run
# or you could just add a single command
# e.g. echo "hello world!"
# better to use absolute path

#python /share/phoenix/nfs04/S7/emc348/stylegan3/train.py --outdir=/share/phoenix/nfs04/S7/emc348/stylegan3/training-runs --data=/share/phoenix/nfs04/S7/emc348/nerf/eg3d/cars_train.zip --cfg=cam-field --gpus=2 --batch=32 --gamma=0.3 --snap=20 --metrics=none --cond=1 --aug=noaug --resume=/share/cuvl/emc348/pretrained_models/stylegan2-ffhq-512x512.pkl
python /share/phoenix/nfs04/S7/emc348/stylegan3/train.py --outdir=/share/phoenix/nfs04/S7/emc348/stylegan3/training-runs --data=/share/cuvl/sh844/FFHQ_1024.zip --cfg=ray-cond-3 --gpus=2 --batch=32 --gamma=10 --snap=20 --metrics=none --cond=1 --aug=noaug --resume=/share/phoenix/nfs04/S7/emc348/nerf/eg3d/stylegan3-t-ffhq-1024x1024.pkl

