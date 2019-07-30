FROM dclong/jupyterhub-beakerx

RUN apt-get update -y \
    && apt-get install -y \
        wajig wamerican \
        proxychains wget \
    && apt-get autoremove \
    && apt-get clean

# proxychains configuration
COPY settings/proxychains.conf /etc/proxychains.conf

EXPOSE 5006
