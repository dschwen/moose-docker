FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    wget 

# get and install the MOOSE mini-binary package
RUN cd / && \
    echo Downloading && \
    wget http://www.schwen.de/moose-bin.tgz && \
    tar xvzPf moose-bin.tgz --skip-old-files

RUN wget https://raw.githubusercontent.com/dschwen/moose/bisect_6389/test/tests/postprocessors/findvalueonline/findvalueonline.i

RUN /ssd/schwd/moose/modules/combined/modules-opt -i findvalueonline.i

