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

#RUN pip3 install --no-cache-dir --upgrade --ignore-installed entrypoints
RUN pip3 install --no-cache-dir \
        loguru pysnooper \
        numpy scipy pandas 'pyarrow>=0.14.0' \
        scikit-learn lightgbm graphviz \
        matplotlib bokeh holoviews[recommended] hvplot \
        tabulate \
        'JPype1>=0.7.0' sqlparse \
        requests[socks] lxml notifiers \
        git+https://github.com/dclong/dsutil@main
#RUN jupyter labextension install @pyviz/jupyterlab_pyviz \
#    && npm cache clean --force

COPY scripts/ /scripts/
# proxychains configuration
COPY settings/proxychains.conf /etc/proxychains.conf

# expose an extra port just in case you need to start another service inside the docker
EXPOSE 5006
