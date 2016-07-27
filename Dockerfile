FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    bison \
    flex \
    gcc \
    gcc-arm-linux-gnueabi \
    make \
    wget \
&& rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash builder
USER builder

WORKDIR /home/builder

COPY entrypoint.sh .

ENTRYPOINT ["/home/builder/entrypoint.sh"]
