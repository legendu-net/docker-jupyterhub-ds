# [dclong/jupyterhub-ds](https://hub.docker.com/r/dclong/jupyterhub-ds/)

JupyterHub for Data Science.
**This is the recommended Docker image to use
if you want to do data science related work in JupyterLab/Jupyter Notebook.**
Note: Python packages in this version are managed using pip.
If you prefer managing Python packages using conda, 
please use the **conda3** (corresponds to the conda3 tag) branch instead.

## Detailed Information

OS: Ubuntu 16.04  
Desktop Environment: None  
Remote Desktop: None  
Jupyter Notebook: 5.6.0  
NodeJS: 8.11.3  
JupyterLab: 0.33.2  
JupyterHub: 0.9.1  
OpenJDK 8  
Maven: 3.3.9  
Jupyter Kernels:  
- Python 3.5.2 (with popular packages)  
    + numpy scipy pandas dask  
    + torch torchvision tensorflow keras h2o  
    + gensim nltk  
    + scikit-learn xgboost  
    + matplotlib seaborn bokeh plotly  
    + tabulate  
    + JayDeBeApi pymysql pymongo sqlalchemy  
    + pysocks  
    + requests[socks] Scrapy beautifulsoup4 wget  
    + ansible
- SQL (based on JDBC) via BeakerX 1.0.0
- Scala 2.11.2 via BeakerX 1.0.0
- Java 8, Clojure, Groovy, Kotlin via BeakerX 1.0.0

## Usage in Linux/Unix

### Prerequisites
You must have Docker installed.
If you are on Ubuntu,
the just use the command below to install the community edition of Docker.
```
sudo apt-get install docker.io
```
If you'd rather install the enterprise edition
or if you are on other platforms,
please refer to the offical Docker doc [Install Docker](https://docs.docker.com/install/).

### Pull the Docker Image
```
docker pull dclong/jupyterhub-ds
```
For people in mainland of China,
please refer to the post
[Speedup Docker Pulling and Pushing](http://www.legendu.net/en/blog/speedup-docker-pulling-and-pushing/)
on ways to speed up pushing/pulling of Docker images.
If you don't bother,
then just use the command below.
```
docker pull registry.docker-cn.com/dclong/jupyterhub-ds
```

### Start a Container

Below are some Docker command arguments explained.
These are for properly handling file permissions in the Docker container and on the host.
Keep the default if you don't know what are the best to use.
`DOCKER_PASSWORD` is probably the only argument you want to and should change.

- `DOCKER_USER`: The user to be created (dynamically) in the container.
    By default, the name of the current user on the host is used.
- `DOCKER_USER_ID`: The ID of the user to be created in the container.
    By default, the ID of the current user on the host is used.
- `DOCKER_PASSWORD`: The password of the user to be created.
    By default, it's the same as the user name.
    You'd better change it for security reasons.
    Of course, users can always change it later using the command `passwd`.
- `DOCKER_GROUP_ID`: The group of the user to be created.
    By default, it's the group ID of the current user on the host.
- `DOCKER_ADMIN_USER`: The admin of the JupyterLab server.
    By default, it's the user to be created in the container.
- `USER_MEM_LIMIT`: The memory limit that each user can use.
    Note that this optional is not in effect now.

The root directory of JupyterLab/Jupyter notebooks is `/workdir` in the container.
You can mount directory on the host to it as you wish.
In the illustration command below,
I have the directory `/wwwroot` on the host mounted to `/workdir` in the container.

```
docker run -d \
    --log-opt max-size=50m \
    -p 8000:8000 \
    -p 5006:5006 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -e DOCKER_PASSWORD=`id -un` \
    -e DOCKER_GROUP_ID=`id -g` \
    -e DOCKER_ADMIN_USER=`id -un` \
    -e USER_MEM_LIMIT=4G \
    -v /wwwroot:/workdir \
    -v /home:/home_host \
    dclong/jupyterhub-ds
```
```
docker run -d \
    --log-opt max-size=50m \
    -p 8000:8000 \
    -p 5006:5006 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -e DOCKER_PASSWORD=`id -un` \
    -e DOCKER_GROUP_ID=`id -g` \
    -e DOCKER_ADMIN_USER=`id -un` \
    -e USER_MEM_LIMIT=4G \
    -v $HOME:/workdir \
    dclong/jupyterhub-ds
```
```
docker run -d \
    --log-opt max-size=50m \
    -p 8000:8000 \
    -p 5006:5006 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -e DOCKER_PASSWORD=`id -un` \
    -e DOCKER_GROUP_ID=`id -g` \
    -e DOCKER_ADMIN_USER=`id -un` \
    -e USER_MEM_LIMIT=4G \
    -v `pwd`:/workdir \
    registry.docker-cn.com/dclong/jupyterhub-ds
```
## Use the JupyterHub Server

Open your browser and and visit `your_host_ip:8000`
where `your_host_ip` is the URL/ip address of your server.
You will be asked for user name (by default your user name on the host)
and password (by default your user name on the host and might want to change it for security reasons).
You can of course change your user password later
using the command `passwd` in the container.  

## Add a New User to the JupyterHub Server

By default,
any user in the Docker container can visit the JupyterHub server.
So if you want to grant access to a new user,
just create an account for him in the Docker container.
You can of course use the well know commands `useradd`, `adduser`, etc. to achive it.
To make things easier for you,
there are some shell scripts in the directory `/scripts/` to create usres for you.

- `/scripts/create_user.sh`: Create a new user. It's the base script for creating users.
- `/scripts/create_user_group.sh`: Create a new user with the given (existing) group.
- `/scripts/create_user_nogroup.sh`: Create a new user with group name `nogroup`.
- `/scripts/create_user_docker.sh`: Create a new user with group name `docker`.

You can use the option `-h` to print help doc for these commands.
For example, `/scripts/create_user_nogroup.sh -h` prints the below help doc.
```
Create a new user with the group name "nogroup".
Syntax: create_user_nogroup user user_id [password]
Arguments:
user: user name
user_id: user id
password: Optional password of the user. If not provided, then the user name is used as the password.
```
Now suppose you want to create a new user `dclong` with user ID `2000` and group name `nogroup`,
you can use the following command.
```
sudo /scripts/create_user_nogroup.sh dclong 2000
```
Since we didn't specify a password for the user,
the default password (same as the user name) is used.

## Known Issues

1. Lack of resource management.
    The argument `USER_MEM_LIMIT` is not in effect due to the default Spawner used.
    This is not big issue if you have a few light users.
    However,
    if there are many heavy users (especially Spark notebook users) you server can run out of memory.
    It's good practice to deploy the Docker container on a server with large memory
    if it's intended for use by a team
    and have users close unused notebooks to save memory.  
2. The subprocess managment issue.
    This is not an issue at in most use cases.
    This Docker image launch service using a shell script
    so there won't be orphan subprocesses
    when the process of the Docker container is get killed.
    However, launching by shell script is not the best way for managing processes.
    I might switch to the [Supervisor](https://github.com/Supervisor/supervisor) for process management
    or use the base image of [pushion/ubuntu](https://github.com/phusion/baseimage-docker) in future.

## Related Images

[dclong/ubuntu_b](https://hub.docker.com/r/dclong/ubuntu_b/)

- [dclong/conda](https://hub.docker.com/r/dclong/conda/)
    - [dclong/jupyter](https://hub.docker.com/r/dclong/jupyter/)
        - [dclong/jupyterlab](https://hub.docker.com/r/dclong/jupyterlab)
            - [dclong/jupyterhub](https://hub.docker.com/r/dclong/jupyterhub/)
                - [dclong/jupyterhub-py](https://hub.docker.com/r/dclong/jupyterhub-py/)
                    - [dclong/jupyterhub-beaker](https://hub.docker.com/r/dclong/jupyterhub-beakerx/)
                        - [dclong/jupyterhub-ds](https://hub.docker.com/r/dclong/jupyterhub-ds/)

## About the Author

[Personal Blog](http://www.legendu.net)   |   [GitHub](https://github.com/dclong)   |   [Bitbucket](https://bitbucket.org/dclong/)   |   [LinkedIn](http://www.linkedin.com/in/ben-chuanlong-du-1239b221/)
