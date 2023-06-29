FROM ubuntu:latest

WORKDIR /app

ENV TZ=Asia/Bangkok

RUN apt-get update && apt-get upgrade -y \
    && mkdir /share

COPY ./share /app/share


CMD ["/bin/bash"]
