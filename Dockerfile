FROM dclong/jupyterhub-beakerx

RUN apt-get update -y \
    && apt-get install -y \
        proxychains \
    && apt-get autoremove \
    && apt-get autoclean

# proxychains configuration
COPY settings/proxychains.conf /etc/proxychains.conf

EXPOSE 5006
