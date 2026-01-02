# NAME: dclong/jupyterhub-ds
FROM dclong/jupyterhub-more
# GIT: https://github.com/legendu-net/docker-jupyterhub-more.git

RUN apt-get -y update \
    && apt-get -y install --no-install-recommends \
        cron wamerican \
        proxychains wget git-lfs \
        highlight \
    && /scripts/sys/purge_cache.sh

#RUN pip3 install --upgrade --ignore-installed entrypoints
RUN pip3 install --break-system-packages \
        loguru pysnooper \
        numpy scipy polars pandas 'pyarrow>=0.14.0' \
        scikit-learn lightgbm graphviz \
        matplotlib bokeh holoviews[recommended] hvplot pyviz_comms \
        tabulate \
        'JPype1>=0.7.0' sqlparse \
        requests[socks] lxml notifiers \
        aiutil[jupyter] github_rest_api \
    && /scripts/sys/purge_cache.sh

#COPY scripts/ /scripts/
# proxychains configuration
COPY settings/proxychains.conf /etc/proxychains.conf

# expose an extra port just in case you need to start another service inside the docker
EXPOSE 5006
