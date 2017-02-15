# This dockerfile uses the ubuntu image
# VERSION 1 - EDITION 1
# Author: Chenliang Wang <hi181904665@gmail.com>


# Base image to use, this must be set as the first line
FROM ubuntu

# Maintainer: docker_user <docker_user at email.com> (@docker_user)
MAINTAINER hi181904665@gmail.com

# Add XX-Net
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get install --no-install-recommends -y \
python \
python-openssl \
libffi-dev \
python-gtk2 \
python-appindicator \
libnss3-tools

# Clean apt cache
RUN apt-get clean

# Copy file to container
RUN mkdir -p /opt/XX-Net
COPY SwitchyOmega /opt/XX-net/SwitchyOmega
COPY launcher /opt/XX-Net/launcher
ADD start /opt/XX-Net/start
RUN chmod +x /opt/XX-Net/start

# Commands when creating a new container
WORKDIR /opt/XX-Net/
CMD ["/bin/bash", "/opt/XX-Net/start"]
