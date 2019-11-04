#!/bin/bash

cp -r /home_host/$(id -un)/.ssh $HOME/
ln -svf /home_host/$(id -un)/archives $HOME/
ln -svfT /workdir/user/$(id -un) $HOME/projects

$HOME/archives/config/linstall.py git -c
$HOME/archives/config/linstall.py svim -ic
$HOME/archives/config/linstall.py ipy3 -c
$HOME/archives/config/linstall.py dsutil -ic
