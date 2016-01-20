FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    gfortran \
    tcl \
    git \
    m4 \
    freeglut3 \
    doxygen \
    libblas-dev \
    liblapack-dev \
    libx11-dev

RUN wget http://mooseframework.org/static/media/uploads/files/moose-environment_ubuntu_14.04_1.1-36.x86_64.deb && \
    dpkg -i moose-environment_ubuntu_14.04_1.1-36.x86_64.deb

RUN adduser -m --disabled-password --gecos '' moose

