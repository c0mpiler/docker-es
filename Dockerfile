FROM docker.elastic.co/elasticsearch/elasticsearch:6.6.2
COPY --chown=elasticsearch:elasticsearch jvm.options /usr/share/elasticsearch/config/
