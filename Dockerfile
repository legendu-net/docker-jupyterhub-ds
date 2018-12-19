FROM dclong/jupyterhub-beakerx:18.10

RUN apt-get update -y \
    && apt-get install -y \
        tmux \
        q-text-as-data \
        julia \
    && apt-get autoremove \
    && apt-get autoclean

# install IJulia  
ENV JUPYTER=/usr/local/bin/jupyter
RUN julia -e 'empty!(DEPOT_PATH); push!(DEPOT_PATH, "/usr/share/julia"); using Pkg; Pkg.add("IJulia")' \
    && cp -r /root/.local/share/jupyter/kernels/julia-* /usr/local/share/jupyter/kernels/ \
    && chmod -R +rx /usr/share/julia/ \
    && chmod -R +rx /usr/local/share/jupyter/kernels/julia-*/

# configure proxychains
COPY settings/proxychains.conf /etc/proxychains.conf

# install Teradata ODBC
COPY scripts/ /scripts/
RUN apt-get update -y \
    && apt-get install -y /scripts/tdodbc1620.deb \
    && rm -rf /scripts/tdodbc1620.deb \
    && apt-get autoremove \
    && apt-get autoclean 
RUN pip3 install teradata sqlalchemy-teradata
ENV ODBCHOME=/opt/teradata/client/ODBC_64 ODBCINI=/opt/teradata/client/ODBC_64/odbc.ini
RUN echo 'export ODBCHOME=/opt/teradata/client/ODBC_64' >> /etc/profile \
    && echo 'export ODBCINI=/opt/teradata/client/ODBC_64/odbc.ini' >> /etc/profile 

EXPOSE 5006
