FROM ubuntu:trusty
MAINTAINER vranac<vranac@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -qy --no-install-recommends \
    ca-certificates \
    python \
    python-gpgme \
    wget

RUN set -x \
    && wget --quiet https://www.dropbox.com/download?plat=lnx.x86_64 -O /root/dropbox.tgz \
    && wget --quiet https://www.dropbox.com/download?dl=packages/dropbox.py -O /root/dropbox.py \
    && chmod a+x /root/dropbox.py \
    && cd root \
    && tar xfz dropbox.tgz \
    && rm dropbox.tgz 2> /dev/null

CMD ["/root/.dropbox-dist/dropboxd"]

