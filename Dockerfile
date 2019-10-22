FROM dclong/jupyterhub-beakerx

RUN apt-get update -y \
    && apt-get install -y \
        cron wamerican wajig \
        proxychains wget git-lfs \
        highlight \
    && apt-get autoremove \
    && apt-get clean

# proxychains configuration
COPY settings/proxychains.conf /etc/proxychains.conf

EXPOSE 5006
