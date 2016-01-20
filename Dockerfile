FROM ubuntu:trusty
MAINTAINER vranac<vranac@gmai.com>

RUN apt-get update
RUN apt-get install python python-gpgme

ADD https://www.dropbox.com/download?plat=lnx.x86_64 ~/dropbox.tgz
ADD https://www.dropbox.com/download?dl=packages/dropbox.py ~/dropbox.py
RUN chmod a+x ~/dropbox.py

RUN tar xfvz ~/dropbox.tgz && rm ~/dropbox.tgz

CMD python ~/dropbox.py start