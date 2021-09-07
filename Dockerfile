# NAME: dclong/jupyterhub-ds
FROM dclong/jupyterhub-more
# GIT: https://github.com/dclong/docker-jupyterhub-more.git

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        cron wamerican \
        proxychains wget git-lfs \
        highlight \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#RUN pip3 install --upgrade --ignore-installed entrypoints
RUN pip3 install \
        loguru pysnooper \
        numpy scipy pandas 'pyarrow>=0.14.0' \
        scikit-learn lightgbm graphviz \
        matplotlib bokeh holoviews[recommended] hvplot pyviz_comms \
        tabulate \
        'JPype1>=0.7.0' sqlparse \
        requests[socks] lxml notifiers \
        git+https://github.com/dclong/dsutil@main \
    && pip3 cache purge

COPY scripts/ /scripts/
# proxychains configuration
COPY settings/proxychains.conf /etc/proxychains.conf

# expose an extra port just in case you need to start another service inside the docker
EXPOSE 5006
