#!/bin/bash

docker pull dclong/jupyterhub-more:next
docker build -t dclong/jupyterhub-ds:next .
