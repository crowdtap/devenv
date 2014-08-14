FROM ubuntu:14.04
MAINTAINER Michael D'Auria <michaeld@crowdtap.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install build-essential wget -y

VOLUME [ "/logs" ]
VOLUME [ "/data" ]

CMD ["/bin/bash"]
