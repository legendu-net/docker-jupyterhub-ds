FROM dclong/jupyterlab-ds

RUN npm install -g configurable-http-proxy \
    && pip3 install jupyterhub

ADD jupyter_notebook_config.py /etc/jupyter/
ADD jupyterhub_config.py /etc/jupyterhub/
ADD script.sh /
ADD init.sh /
ADD inotify.sh /

EXPOSE 8000

ENTRYPOINT ["/init.sh"]
