FROM kibana:latest

RUN sed 'httpredir.debian.org/mirrors.aliyun.com' -i /etc/apt/sources.list
RUN apt-get update && apt-get install -y netcat

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

RUN kibana plugin --install elastic/sense

CMD ["/tmp/entrypoint.sh"]
