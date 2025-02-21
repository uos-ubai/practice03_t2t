#!/bin/bash
#SBATCH --job-name=t2t_g
#SBATCH --output=./output/t2t_%n_%j.out
#SBATCH --error=./output/t2t_%n_%j.err
#SBATCH --nodes=1
#SBATCH --partition=gpu4
#SBATCH --gres=gpu:4
#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --time=24:00:00

echo "start at:" `date` # 접속한 날짜 표기
echo "node: $HOSTNAME" # 접속한 노드 번호 표기
echo "jobid: $SLURM_JOB_ID" # jobid 표기

# Load modules (cuda 환경)
module load cuda/11.8 # 

# Load env (python 환경)
source ~/miniconda3/bin/activate ubai
pip install --upgrade pip  # pip 최신 버전 유지
pip install -r requirements.txt # 필요 라이브러리 설치

# 스크립트 실행
python generation.py

