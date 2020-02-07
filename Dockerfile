FROM ubuntu:latest

MAINTAINER anchaubey <ankitchaubey091987@gmail.com>

WORKDIR /usr/apps/hello-docker/

RUN apt-get -y update

RUN apt-get install -y nodejs

RUN apt-get install -y npm

EXPOSE 3000

#RUN ln -s /usr/bin/nodejs /usr/bin/node........;;;;;

ADD . /usr/apps/hello-docker/

ADD index.js /usr/apps/hello-docker/index.js

CMD ["node", "index.js"]
