FROM dclong/jupyterlab-ds

RUN npm install -g configurable-http-proxy \
    && pip3 install jupyterhub==0.8.0rc1

ENTRYPOINT ["/init.sh"]
