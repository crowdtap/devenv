FROM crowdtap/java
MAINTAINER Michael D'Auria <michaeld@crowdtap.com>
ENV ELASTICSEARCH_VERSION 1.3.2

RUN mkdir -p /data/elasticsearch/plugins /data/elasticsearch/work /logs/elasticsearch
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz
RUN tar xf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && rm -f elasticsearch-$ELASTICSEARCH_VERSION.tar.gz
RUN mv elasticsearch-$ELASTICSEARCH_VERSION /opt/elasticsearch

ADD elasticsearch.yml elasticsearch.yml

EXPOSE 9200
EXPOSE 9300

CMD ["/opt/elasticsearch/bin/elasticsearch"]
#ENTRYPOINT ["/bin/bash"]
