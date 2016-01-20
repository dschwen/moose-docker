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
    libx11-dev

# get and install the MOOSE redistributable package
RUN wget http://mooseframework.org/static/media/uploads/files/${moose_deb} && \
    dpkg -i ${moose_deb} && \
    rm ${moose_deb}

# replace sh with bash for further RUN commands
RUN ln -snf /bin/bash /bin/sh

# Add moose user
RUN adduser --disabled-password --gecos '' moose

# setup the shell environment
COPY bashrc.local /home/moose/
RUN chown moose /home/moose/bashrc.local
RUN echo ". ~/bashrc.local" >> /home/moose/.bashrc
ENV BASH_ENV /home/moose/bashrc.local

# execute all further commnds as the user in its home directory
USER moose
WORKDIR /home/moose

# clone the moose repository
RUN mkdir ~/projects && \
    cd ~/projects && \
    git clone https://github.com/idaholab/moose.git && \
    cd ~/projects/moose && \
    git checkout master

# build libmesh
RUN /bin/bash -c "source ~/bashrc.local && \
    cd ~/projects/moose && \
    scripts/update_and_rebuild_libmesh.sh"

# build and run tests
RUN /bin/bash -c "source ~/bashrc.local && \
    cd ~/projects/moose/test && \
    make -j8 && \
    ./run_tests -j8"

