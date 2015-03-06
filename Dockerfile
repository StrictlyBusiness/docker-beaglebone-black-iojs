FROM resin/armv7hf-debian:jessie

MAINTAINER Sean Lynch <sean.lynch@sbcs.com>

# Install packages
#  - io.js, curl, git
#  - build-essential: needed for compilation (NPM packages / dtc.sh)
#  - sudo: needed for dtc.sh build script
RUN apt-get update && \
    apt-get -y install curl lsb-release && \
    curl -sL https://deb.nodesource.com/setup_iojs_1.x | bash - && \
    apt-get -y install iojs git build-essential sudo vim

# Download device tree compiler with symbol (-@) support
WORKDIR /dtc-build
RUN curl -LO https://raw.github.com/RobertCNelson/tools/master/pkgs/dtc.sh && \
    chmod +x dtc.sh && \
    ./dtc.sh

WORKDIR /

CMD ["iojs"]
