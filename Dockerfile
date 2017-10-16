FROM dclong/jupyterlab-ds

RUN npm install -g configurable-http-proxy \
    && pip3 install jupyterhub==0.8.0rc1

ADD jupyter_notebook_config.py /etc/jupyter/
ADD jupyterhub_config.py /etc/jupyterhub/
ADD script.sh /
ADD init.sh /

EXPOSE 8000

ENTRYPOINT ["/init.sh"]
