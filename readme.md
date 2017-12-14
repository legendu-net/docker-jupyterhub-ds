# [dclong/jupyterhub-ds](https://hub.docker.com/r/dclong/jupyterhub-ds/)

JupyterHub for Data Science. 

## About the Author

[Personal Blog](http://www.legendu.net)   |   [GitHub](https://github.com/dclong)   |   [Bitbucket](https://bitbucket.org/dclong/)   |   [LinkedIn](http://www.linkedin.com/in/ben-chuanlong-du-1239b221/)

## Usage in Linux/Unix

### Get the Docker Image
```
docker pull dclong/jupyterhub-ds
```

### Run a Container
```
docker run -d \
    --log-opt max-size=50m \
    -p 8000:8000 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -e DOCKER_PASSWORD=`id -un` \
    -e DOCKER_GROUP_ID=`getent group nogroup | cut -d: -f3` \
    -e DOCKER_ADMIN_USER=`id -un` \
    -v /wwwroot:/jupyter \
    -v /home:/home_host \
    dclong/jupyterhub-ds
```

```
docker run -d \
    --log-opt max-size=50m \
    -p 8000:8000 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -e DOCKER_PASSWORD=`id -un` \
    -e DOCKER_GROUP_ID=`getent group nogroup | cut -d: -f3` \
    -e DOCKER_ADMIN_USER=`id -un` \
    -v /wwwroot:/jupyter \
    -v /wwwroot:/wwwroot \
    -v /home:/home_host \
    dclong/jupyterhub-ds
```
