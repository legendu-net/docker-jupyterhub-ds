# NAME: dclong/jupyterhub-ds
FROM dclong/jupyterhub-more
# GIT: https://github.com/dclong/docker-jupyterhub-more.git

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        cron wamerican \
        proxychains wget git-lfs \
        highlight \
    && apt-get autoremove \
    && apt-get clean
# RUN xinstall spark -ic && xinstall pyspark -ic

COPY scripts/ /scripts/
# proxychains configuration
COPY settings/proxychains.conf /etc/proxychains.conf

# expose an extra port just in case you need to start another service inside the docker
EXPOSE 5006
