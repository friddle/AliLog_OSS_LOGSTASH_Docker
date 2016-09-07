#!/usr/bin/env bash

# Wait for the Elasticsearch container to be ready before starting Logstash.
echo "Stalling for Elasticsearch"
while true; do
    nc -q 1 elasticsearch 9200 2>/dev/null && break
done

echo "Starting Logstash"
exec /opt/logstash/bin/logstash -f /opt/logstash/conf --allow-env
