#!/bin/bash

# create a user
DOCKER_GROUP=${DOCKER_GROUP:-docker} 
/scripts/create_user.sh $DOCKER_USER ${DOCKER_USER_ID:-9001} ${DOCKER_PASSWORD:-$DOCKER_USER} $DOCKER_GROUP ${DOCKER_GROUP_ID:-9001}

# add admin user to JupyterHub
sed -i "s/^c\.JupyterHub\.admin_users\s*=\s*set(.*)\s*$/c.JupyterHub.admin_users = set('${DOCKER_ADMIN_USER:-$DOCKER_USER}')/g" /etc/jupyterhub/jupyterhub_config.py 

mkdir -p "$NOTEBOOK_DIR"
chown $USER:$DOCKER_GROUP "$NOTEBOOK_DIR"

/scripts/launch.sh

