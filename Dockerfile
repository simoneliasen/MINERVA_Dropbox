FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

ENV PATH=/opt/conda/bin:$PATH

VOLUME /minverva

WORKDIR /minverva

COPY . .

RUN apt update -y && apt upgrade -y && apt install -y wget && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && bash ~/miniconda.sh -b -p /opt/conda && rm ~/miniconda.sh && conda init

RUN conda env create -f ./environment.yml
