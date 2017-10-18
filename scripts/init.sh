#!/bin/bash

# create a user
/scripts/create_user.sh $DOCKER_USER ${DOCKER_USER_ID:-9001} ${DOCKER_PASSWORD:-${DOCKER_USER}} ${DOCKER_GROUP:-docker} ${DOCKER_GROUP_ID:-9001}
# add admin user to JupyterHub
sed -i "s/^c\.JupyterHub\.admin_users\s*=\s*set(.*)\s*$/c.JupyterHub.admin_users = set('${DOCKER_ADMIN_USER:-$DOCKER_USER}')/g" /etc/jupyterhub/jupyterhub_config.py 
chmod 777 /jupyter
/scripts/launch.sh

