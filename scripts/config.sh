#!/bin/bash

ln -svf /home_host/$(id -un)/archives $HOME/
ln -svfT /workdir/user/$(id -un) $HOME/projects

xinstall sshc -c
xinstall git -c
xinstall svim -ic
xinstall ipy3 -c
xinstall dsutil -ic
