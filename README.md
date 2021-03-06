# Docker image for BeagleBone Black io.js applications

Provides a x86-64 Vagrant box with `docker` and `qemu` provisioned to enable building an ARM architecture docker image with io.js support, intended to be ran on a [BeagleBone Black](http://beagleboard.org/black).  Includes an updated device tree compiler (dtc) with symbol (`-@`) support, needed when using [bonescript](https://github.com/jadonk/bonescript).

Currently based off the [mazzolino/armhf-debian](https://registry.hub.docker.com/u/mazzolino/armhf-debian/) docker image. Later I may create the image from scratch following these [instructions](
https://olimex.wordpress.com/2014/07/21/how-to-create-bare-minimum-debian-wheezy-rootfs-from-scratch/).

## Build and push image

    vagrant up
    vagrant ssh
    docker build -t strictlybusiness/beaglebone-black-iojs .
    docker push strictlybusiness/beaglebone-black-iojs

    # Update io.js version and push
    docker tag strictlybusiness/beaglebone-black-iojs strictlybusiness/beaglebone-black-iojs:1.5.0
    docker push strictlybusiness/beaglebone-black-iojs:1.5.0

## Use image

Image is available on the Docker [registry](https://registry.hub.docker.com/u/strictlybusiness/beaglebone-black-iojs/).

Use can use it as a base image within your `Dockerfile`

    FROM strictlybusiness/beaglebone-black-iojs

    ADD . /app
    WORKDIR /app

    RUN npm install

    CMD ["iojs", "index.js"]

Or pull and run directly

    docker run strictlybusiness/beaglebone-black-iojs
