#!/usr/bin/env bash

# add admin user to JupyterHub
sed -i "s/^c\.Authenticator\.admin_users\s*=\s*set(.*)\s*$/c.Authenticator.admin_users = set('${DOCKER_ADMIN_USER:-$DOCKER_USER}')/g" /etc/jupyterhub/jupyterhub_config.py 
