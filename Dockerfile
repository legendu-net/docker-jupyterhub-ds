FROM dclong/jupyterhub-beakerx

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        cron wamerican wajig \
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
