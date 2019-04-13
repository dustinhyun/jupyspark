# JuPySpark

Docker container running local PySpark and JupyterLab on it!

## Pull it and play.

Just run ```./jupyspark_start.sh``` or

```
$ docker pull dustinhyun/jupyspark:latest
$ docker -it -d --name jupyspark -p 8888:8888 -v HOST_VOLUME_PATH:/root/workspace
```

Now play with Jupyter lab on localhost:8888 !

## Build your own image.

```
$ cd jupyspark/build/docker; ls
Dockerfile    entrypoint.sh
$ docker build -t jupyspark:custom -f ./Dockerfile .
$ cd -
$ docker run -it -d --name jupyspark -p 8888:8888 -v `pwd`/workspace:/root/workspace jupyspark:custom bash
```
