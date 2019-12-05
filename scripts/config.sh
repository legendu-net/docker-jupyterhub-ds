#!/bin/bash

ln -svfT /workdir/user/$(id -un) $HOME/projects

xinstall git -c
xinstall svim -ic
xinstall ipy3 -c
