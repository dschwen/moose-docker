# MOOSE

This Dockerfile sets up a container with 

* MOOSE redistributable package
* The Atom editor with recommended packages for MOOSE development
* a cloned and compiled libmesh
* a cloned MOOSE master

As a last step it compiles and runs the MOOSE tests.

## Getting started

Clone the _moose-docker_ repository and enter teh directory

```
git clone https://github.com/dschwen/moose-docker.git
cd moose-docker
```

Build the container and enter it by executing

```
./start_moose
```

At the first run the container is automatically build and all software is installed. 
The next time the command jumps directly to a shell.

## Usage

The `./start_moose` command opens a shell with a fully configured MOOSE build environment.

```
moose@15a94a939a1f:~$ ls -la
total 32
drwxr-xr-x  6 moose moose 4096 Jan 21 01:48 .
drwxr-xr-x 10 root  root  4096 Jan 21 01:48 ..
drwxr-xr-x  6 moose moose 4096 Jan 21 00:39 .atom
-rw-r--r--  1 moose moose  220 Jan 21 00:39 .bash_logout
-rw-r--r--  1 moose moose 3654 Jan 21 00:39 .bashrc
-rw-r--r--  1 moose moose  675 Jan 21 00:39 .profile
-rw-rw-r--  1 moose root   126 Jan 20 19:05 bashrc.local
drwxr-xr-x  5 moose moose 4096 Jan 21 01:48 projects
moose@15a94a939a1f:~$ cd projects/
moose@15a94a939a1f:~/projects$ cd moose/
moose@15a94a939a1f:~/projects/moose$ l
COPYING  COPYRIGHT  LICENSE  README.md  examples/  framework/  gui/  libmesh/  modules/  python/  scripts/  test/  tutorials/  unit/
```

### Compiling an Example

Enter the directory of the first MOOSE example with

```
cd projects/moose/examples/ex01_inputfile/
```

Build the example with

```
make -j 8
```

(this assumes your computer has 8 cores. You can adjust that number to speed up the build.) 
Now run the example with

```
./ex01-opt -i ex01.i
```

Congratulations, you compiled and ran your first MOOSE executable. You should see a bunch of green numbers. To look at the actual simulation
results, we need to start a mesh viewer. Luckily MOOSE comes with one! Start it with

```
~/projects/moose/gui/peacock ex01_out.e
```
