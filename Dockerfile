FROM nsqio/nsq

# Install prerequisites
RUN apt-get update && apt-get install -y \
	curl

ADD ./docker-entrypoint.sh /
RUN chmod +x ./docker-entrypoint.sh
ENTRYPOINT ["/bin/sh", "./docker-entrypoint.sh"]
