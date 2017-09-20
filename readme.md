# dclong/jupyterhub-ds

JupyterHub for Data Science. 

## About the Author

[Personal Blog](http://www.legendu.net)   |   [GitHub](https://github.com/dclong)   |   [Bitbucket](https://bitbucket.org/dclong/)   |   [LinkedIn](http://www.linkedin.com/in/ben-chuanlong-du-1239b221/)

## Usage 

```
docker run -d -p 8888:8888 -p 8787:8787 \ 
    -v /wwwroot:/jupyter \
    -v $HOME:/`id -un` \
    dclong/jupyterhub-ds
```
