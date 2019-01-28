FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.4
COPY --chown=elasticsearch:elasticsearch jvm.options /usr/share/elasticsearch/config/
