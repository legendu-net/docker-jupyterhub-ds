#!/bin/bash

/scripts/create_user $DOCKER_USER ${DOCKER_USER_ID:-9001} ${DOCKER_PASSWORD:-${DOCKER_USER}} ${DOCKER_GROUP:-docker} ${DOCKER_GROUP_ID:-9001}
chmod 777 /jupyter
/scripts/launch.sh

