#!/bin/bash

# create a user
DOCKER_USER_ID=${DOCKER_USER_ID:-9001} 
DOCKER_PASSWORD=${DOCKER_PASSWORD:-$DOCKER_USER} 
DOCKER_GROUP=${DOCKER_GROUP:-docker} 
DOCKER_GROUP_ID=${DOCKER_GROUP_ID:-9001}
/scripts/create_user.sh $DOCKER_USER $DOCKER_USER_ID $DOCKER_PASSWORD $DOCKER_GROUP $DOCKER_GROUP_ID

# add admin user to JupyterHub
sed -i "s/^c\.Authenticator\.admin_users\s*=\s*set(.*)\s*$/c.Authenticator.admin_users = set('${DOCKER_ADMIN_USER:-$DOCKER_USER}')/g" /etc/jupyterhub/jupyterhub_config.py 

cd /root
/scripts/launch.sh

