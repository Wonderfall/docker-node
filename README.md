![](https://i.goopics.net/lq.png)

[![Build Status](https://drone.xataz.net/api/badges/xataz/docker-node/status.svg)](https://drone.xataz.net/xataz/docker-node)

> This image is build and push with [drone.io](https://github.com/drone/drone), a circle-ci like self-hosted.
> If you don't trust, you can build yourself.

## Tag available
* latest, 7.6.0, 7.6, 7 [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/node/latest/Dockerfile)
* onbuild, latest-onbuild, 7.2.1-onbuild, 7.2-onbuild, 7-onbuild [(Dockerfile)](https://github.com/xataz/docker-node/blob/master/latest/Dockerfile.onbuild)
* lts, 6.10.0, 6.10, 6 [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/node/lts/Dockerfile)
* lts-onbuild, 6.9.2-onbuild, 6.9-onbuild, 6-onbuild [(Dockerfile)](https://github.com/xataz/docker-node/blob/master/lts/Dockerfile.onbuild)

## Description
What is Node.js?

Node.js is a software platform for scalable server-side and networking applications. Node.js applications are written in JavaScript and can be run within the Node.js runtime on Mac OS X, Windows, and Linux without changes.

Node.js applications are designed to maximize throughput and efficiency, using non-blocking I/O and asynchronous events. Node.js applications run single-threaded, although Node.js uses multiple threads for file and network events. Node.js is commonly used for real-time applications due to its asynchronous nature.

Node.js internally uses the Google V8 JavaScript engine to execute code; a large percentage of the basic modules are written in JavaScript. Node.js contains a built-in, asynchronous I/O library for file, socket, and HTTP communication. The HTTP and socket support allows Node.js to act as a web server without additional software such as Apache.

## Build Image

```shell
docker build -t xataz/node github.com/xataz/docker-node#master:latest
```

### Build other version
```shell
docker build -t xataz/node:5.9.0 --build-arg NODE_VER=5.9.0 github.com/xataz/docker-node#master:latest
```

## Usage
### Simple run
```
docker run -d -v $(pwd):/usr/app/src -w /usr/app/src xataz/node:6 node app.js
```

### With onbuild
Create a Dockerfile on your project :
```
FROM xataz/node:onbuild

```

And build this :
```
docker build -t myproject .
```

Exemple image integration [here](https://github.com/mondediefr/mondedie-chat/blob/master/Dockerfile)
