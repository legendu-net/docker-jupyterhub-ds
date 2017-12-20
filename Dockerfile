FROM dclong/jupyterlab-ds

RUN npm install -g configurable-http-proxy \
    && pip3 install jupyterhub jupyterhub-systemdspawner

ADD settings/jupyter_notebook_config.py /etc/jupyter/
ADD settings/jupyterhub_config.py /etc/jupyterhub/
ADD scripts /scripts

EXPOSE 8000

ENTRYPOINT ["/scripts/init.sh"]
