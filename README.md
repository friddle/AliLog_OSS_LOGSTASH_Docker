# AliLog_OSS_LOGSTASH_Docker
阿里云日志LogstashDocker镜像,基于https://github.com/friddle/logstash-input-oss
使用方式是在阿里云容器服务里面添加服务

```
nginx-logstash:
  image: 'friddle/oss_logstash'
  restart: always
  environment:
    - LANG=C.UTF-8
    - JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
    - LOGSTASH_MAJOR=2.3
    - LS_SETTINGS_DIR=/etc/logstash
    - OSSTYPE=nginx
    - ENDPOINT=oss-cn-hangzhou-internal.aliyuncs.com
    - ACCESS_KEY_SECRET=<SECRET_KEY>
    - ACCESS_KEY_ID=<SECRET_ID>
    - BUCKET=<BUCKET>
    - PREFIX=<PREFIX>
    - INDEX=<INDEX>
    - COMPRESSION_TYPE=<SNAPPY:NONE>
    - LOGTYPE=<LOGTYPE>
  labels:
    aliyun.scale: '1'
  links:
    - elasticsearch
  volumes:
    - '/tmp/logstash:/tmp/logstash'
    - '/tmp/logstash-input-oss-tomcat:/root/.logstash-input-oss'
  
elasticsearch:
  image: elasticsearch:latest
  labels: 
      aliyun.routing.port_9200: http://elasticsearch
  volumes:
    - /data/:/usr/share/elasticsearch/data
  command: elasticsearch -Des.network.host=0.0.0.0

kibana:
  image: friddle/kibana:latest
  labels:
    aliyun.routing.port_5601:  log
  links:
    - elasticsearch

```


恭喜你已经配置好阿里云日志了
