FROM ubuntu:latest

WORKDIR /app

ENV TZ=Asia/Bangkok

RUN apt-get update && apt-get upgrade -y \
    && mkdir /share \
    && mkdir /disk

COPY ./disk /app/disk


CMD ["/bin/bash"]
