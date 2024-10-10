FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y \
      build-essential \
      git \
      curl \
      pkg-config \
      make \
      cmake \
      gcc-arm-none-eabi \
      libasound2-dev \
      libcurl4-openssl-dev \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pingdynasty/FirmwareSender \
&& cd FirmwareSender/Builds/Linux \
&& make \
&& cp build/FirmwareSender ~
