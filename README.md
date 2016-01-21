# MOOSE

This Dockerfile sets up a container with the MOOSE redistributable package, a cloned and compiled libmesh, a cloned and compiled MOOSE master, and runs the tests.

### Usage

To install the docker container execute

```
docker pull dschwen/moose
```

To enter the container and work on MOOSE execute

```
docker run -ti dschwen/moose /bin/bash
```

For X11 support (enabling peacock and Atom) execute

```
docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -ti dschwen/moose /bin/bash
```
