FROM crowdtap/base
MAINTAINER Michael D'Auria <michaeld@crowdtap.com>
ENV RABBITMQ_VERSION 3.2.4-1
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /data/rabbitmq && mkdir -p /logs/rabbitmq && \
  chown -R 105 /data/rabbitmq /logs/rabbitmq
RUN apt-get install --no-install-recommends -y rabbitmq-server=$RABBITMQ_VERSION
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management

VOLUME [ "/logs" ]
VOLUME [ "/data" ]

ENV RABBITMQ_LOG_BASE /logs/rabbitmq
ENV RABBITMQ_MNESIA_BASE /data/rabbitmq

EXPOSE 5672 15672 55672
CMD ["/usr/sbin/rabbitmq-server"]
#ENTRYPOINT ["/usr/sbin/rabbitmq-server"]
