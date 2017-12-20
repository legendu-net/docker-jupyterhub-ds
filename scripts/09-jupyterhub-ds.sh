#!/usr/bin/env bash

# add admin user to JupyterHub
sed -i "s/^c\.Authenticator\.admin_users\s*=\s*{.*}\s*$/c.Authenticator.admin_users = {'${DOCKER_ADMIN_USER:-$DOCKER_USER}'}/g" /etc/jupyterhub/jupyterhub_config.py 
sed -i "s/^c\.SystemdSpawner\.mem_limit\s*=\s*'.*'\s*$/c.SystemdSpawner.mem_limit = '${USER_MEM_LIMIT:-4G}'/g" /etc/jupyterhub/jupyterhub_config.py 
