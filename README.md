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
