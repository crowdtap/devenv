FROM crowdtap/base
MAINTAINER Michael D'Auria <michaeld@crowdtap.com>
ENV REDIS_VERSION 2.8.13

RUN mkdir -p /data/redis && mkdir -p /logs/redis
RUN wget http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz
RUN tar xzf redis-$REDIS_VERSION.tar.gz
RUN cd redis-$REDIS_VERSION && make && make install
RUN rm -fr redis-$REDIS_VERSION*

ADD redis.conf redis.conf

EXPOSE 6739
CMD ["redis.conf"]
ENTRYPOINT ["redis-server"]
