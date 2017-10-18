#!/bin/bash
echo "Build SSL certificates"
/scripts/ssl.sh

echo "Setting perms"
/scripts/perms.sh

echo "Start RabbitMQ"
/usr/sbin/rabbitmq-server