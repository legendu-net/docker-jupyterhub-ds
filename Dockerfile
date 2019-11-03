FROM dclong/jupyterhub-beakerx

RUN apt-get update -y \
    && apt-get install -y \
        cron wamerican wajig \
        proxychains wget git-lfs \
        highlight \
    && apt-get autoremove \
    && apt-get clean

COPY scripts/ /scripts/
# proxychains configuration
COPY settings/proxychains.conf /etc/proxychains.conf

# expose an extra port just in case you need to start another service inside the docker
EXPOSE 5006
