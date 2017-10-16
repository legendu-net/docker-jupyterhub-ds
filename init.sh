#!/bin/bash

function create_user() {
    if [[ $1 == "" ]]; then 
        return 1
    fi
    local user=$1
    local user_id=$2
    local password=$3
    local group=$4
    local group_id=$5
    if [[ "$(getent group docker)" == "" ]]; then
        groupadd -o -g $group_id docker
    fi
    useradd -om -u $user_id -g $group -d /home/$user -s /bin/bash -c "$user" $user
    echo $user:$password | chpasswd
    gpasswd -a $user sudo
}

# umask 002
# /bin/bash --login

create_user $DOCKER_USER ${DOCKER_USER_ID:-9001} ${DOCKER_PASSWORD:-${DOCKER_USER}} ${DOCKER_GROUP:-docker} ${DOCKER_GROUP_ID:-9001}
chmod 777 /jupyter
/script.sh
