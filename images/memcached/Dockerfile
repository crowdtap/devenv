FROM crowdtap/base
MAINTAINER Michael D'Auria <michaeld@crowdtap.com>

RUN apt-get install memcached -y
RUN mkdir -p /logs/memcache && chown -R memcache /logs/memcache

EXPOSE 11211

CMD ["-r", "-umemcache", "-v", ">> /logs/memcached/console.log 2>&1"]
ENTRYPOINT ["/usr/bin/memcached"]
