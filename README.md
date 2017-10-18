RabbitMQ with SSL
=========================

RabbitMQ multi-protocol messaging broker with SSL enabled by default

# Usage

Build:

```
$ docker build --rm -t rabbitmq-ssl .
```

Run:

```
docker run -d -p 5672:5672 -p 5671:5671 -p 61613:61613 -p 61614:61614 -p 15672:15672 rabbitmq-ssl
```
