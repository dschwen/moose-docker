FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    wget 

# get and install the MOOSE mini-binary package
RUN cd / && \
    wget http://www.schwen.de/moose-bin.tgz && \
    tar xvzf moose-bin.tgz

RUN ls -latr /

