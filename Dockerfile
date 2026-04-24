FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV MPLCONFIGDIR=/tmp/matplotlib
ENV HOME=/tmp

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 python3-pip git \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache-dir \
    torch==2.1.1+cu118 \
    torchvision==0.16.1+cu118 \
    --index-url https://download.pytorch.org/whl/cu118

RUN pip install --no-cache-dir \
    click==8.3.1 \
    numpy==1.26.4 \
    pandas==2.2.2 \
    rich==14.3.3 \
    tifffile==2025.5.10 \
    imagecodecs==2025.3.30 \
    captum==0.8.0 \
    pytorch_lightning==2.6.1

COPY . /app

RUN pip install --no-cache-dir --no-deps .