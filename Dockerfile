FROM logstash:latest
WORKDIR /opt/logstash
RUN  mkdir /opt/logstash/temp
COPY ./logstash-input-oss-1.0.0.gem /opt/logstash/temp/
RUN  /opt/logstash/bin/logstash-plugin install /opt/logstash/temp/logstash-input-oss-1.0.0.gem
ENV PATH                     /opt/logstash/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/logstash/vendor/jruby/bin
ENV OSSTYPE                  application/octet-stream
ENV ENDPOINT                 oss-cn-hangzhou-internal.aliyuncs.com
ENV ACCESS_KEY_SECRET        KEY_SECRET
ENV ACCESS_KEY_ID            KEYID
ENV BUCKET                   BUCKET
ENV PREFIX                   tomcat
ENV LOGTYPE                  tomcat
ENV INDEX                    error
ENV COMPRESSION_TYPE         snappy
RUN  mkdir -p /opt/logstash/conf
COPY ./config/logstash.conf   /opt/logstash/conf/
ENTRYPOINT /opt/logstash/bin/logstash -f /opt/logstash/conf --allow-env

