FROM ubuntu:14.04
ENV moose_deb moose-environment_ubuntu_14.04_1.1-36.x86_64.deb

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
    libx11-dev \
    libglib2.0-0 \
    libgl1-mesa-dri

# get and install the MOOSE redistributable package
RUN wget http://mooseframework.org/static/media/uploads/files/${moose_deb} && \
    dpkg -i ${moose_deb} && \
    rm ${moose_deb}

# install prerequisites for Atom
RUN apt-get install -y \
    gconf2 \ 
    gconf-service \
    libgtk2.0-0 \
    libnotify4 \
    libxtst6 \
    libnss3 \
    python \
    gvfs-bin \
    xdg-utils

# get and install the Atom editor
RUN wget https://atom.io/download/deb -O atom.deb && \
    dpkg -i atom.deb && \
    rm atom.deb

# replace sh with bash for further RUN commands
RUN ln -snf /bin/bash /bin/sh

# add moose user
RUN adduser --disabled-password --gecos '' moose

# setup the shell environment
COPY bashrc.local /home/moose/
RUN chown moose /home/moose/bashrc.local
RUN echo ". ~/bashrc.local" >> /home/moose/.bashrc
ENV BASH_ENV /home/moose/bashrc.local

# execute all further commands as the user in its home directory
USER moose
WORKDIR /home/moose

# install recommended Atom packages
RUN apm install language-moose && \
    apm install autocomplete-moose && \
    apm install switch-header-source && \
    apm install make-runner && \
    apm install split-diff && \
    apm install git-blame && \
    apm install line-diff-details && \
    apm install merge-conflicts

