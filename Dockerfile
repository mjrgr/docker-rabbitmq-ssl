FROM       debian:jessie
MAINTAINER mehdijrgr

ADD ssl /ssl
ADD scripts /scripts
ADD rabbitmq.config /etc/rabbitmq/rabbitmq.config
RUN chmod +x /scripts/*.sh

RUN apt-get update && \
    apt-get install adduser wget init-system-helpers openssl logrotate socat erlang erlang-nox -y && \
    apt-get autoclean && \
    apt-get autoremove

ENV RABBITMQ_VERSION 3.6.12

RUN wget https://www.rabbitmq.com/releases/rabbitmq-server/v$RABBITMQ_VERSION/rabbitmq-server_$RABBITMQ_VERSION-1_all.deb && \
    dpkg -i rabbitmq-server_$RABBITMQ_VERSION-1_all.deb && \
    rm -rf rabbitmq-server_$RABBITMQ_VERSION-1_all.deb && \
    rabbitmq-plugins enable rabbitmq_web_stomp rabbitmq_stomp rabbitmq_management

EXPOSE 5671 61614 15672 5672 61613

CMD ["/scripts/run.sh"]
