#!/bin/bash

docker run -it -d --name jupyspark -v `pwd`/workspace:/root/workspace -p 8080:8888 dustinhyun/jupyspark:latest
