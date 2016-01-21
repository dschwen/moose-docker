#!/bin/bash
source ~/bashrc.local 

# checkout MOOSE
cd ~/projects
git clone https://github.com/idaholab/moose.git
cd ~/projects/moose 
git checkout master

# build libmesh
cd ~/projects/moose
scripts/update_and_rebuild_libmesh.sh

# build and run tests
cd ~/projects/moose/test && \
make -j8 && \
./run_tests -j8 &&\
touch ~/projects/.done
