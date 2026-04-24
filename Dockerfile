FROM pytorch/pytorch:2.1.0-cuda11.8-cudnn8-runtime

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV MPLCONFIGDIR=/tmp/matplotlib
ENV HOME=/tmp

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install .