FROM ubuntu:trusty
MAINTAINER vranac<vranac@gmai.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -qy python python-gpgme

ADD https://www.dropbox.com/download?plat=lnx.x86_64 /root/dropbox.tgz
ADD https://www.dropbox.com/download?dl=packages/dropbox.py /root/dropbox.py
RUN chmod a+x /root/dropbox.py

RUN cd root && tar xfvz dropbox.tgz && rm dropbox.tgz

CMD /root/.dropbox-dist/dropboxd