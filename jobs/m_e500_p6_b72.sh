#!/bin/bash
#SBATCH --nodes=1
#SBATCH --gpus-per-node=4
#SBATCH --time=1-00:00:00
#SBATCH --job-name=m_e500_p6_b72
#SBATCH --output=%x.out
#SBATCH -p compute_full_node

module load anaconda3
source activate yolo-pose
source deactivate yolo-pose
source activate yolo-pose

python train.py \
--img 1280 \
--batch 72 \
--epochs 500 \
--data data/coco_kp.yaml \
--hyp data/hyps/hyp.kp-p6.yaml \
--val-scales 1 \
--val-flips -1 \
--weights yolov5m6.pt \
--project runs/m_e500_p6_b72 \
--name train \
--workers 128 \
--resume runs/m_e500_p6_b72/train/weights/last.pt