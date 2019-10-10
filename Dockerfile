FROM docker.elastic.co/elasticsearch/elasticsearch:6.8.3
COPY --chown=elasticsearch:elasticsearch jvm.options /usr/share/elasticsearch/config/

USER root
RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
COPY elastic.repo /etc/yum.repos.d/elastic.repo

RUN yum -y update
# RUN yum install -y filebeat packetbeat metricbeat heartbeat-elastic
#
# RUN chkconfig --add filebeat
# RUN chkconfig --add packetbeat
# RUN chkconfig --add metricbeat
# RUN chkconfig --add heartbeat-elastic

RUN yum install -y java-1.8.0-openjdk

RUN printf "\n%s\n%s\n%s" "grant {" "        permission java.security.AllPermission;" "};" >> /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-2.el7_6.x86_64/jre/lib/security/java.policy

USER elasticsearch

RUN elasticsearch-plugin install -b analysis-icu
RUN elasticsearch-plugin install -b analysis-kuromoji
RUN elasticsearch-plugin install -b analysis-phonetic
RUN elasticsearch-plugin install -b mapper-murmur3
RUN elasticsearch-plugin install -b mapper-size
