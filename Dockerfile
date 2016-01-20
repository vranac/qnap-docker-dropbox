FROM ubuntu:trusty
MAINTAINER vranac<vranac@gmai.com>

RUN apt-get update
RUN apt-get upgrade -y

ADD https://www.dropbox.com/download?plat=lnx.x86_64 /dropbox.tgz
RUN tar xfvz /dropbox.tgz && rm /dropbox.tgz

ENTRYPOINT /.dropbox-dist/dropboxd