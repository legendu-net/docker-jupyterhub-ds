#!/bin/bash

Rscript -e 'IRkernel::installspec()'
jupyterhub -f /etc/jupyterhub/jupyterhub_config.py
