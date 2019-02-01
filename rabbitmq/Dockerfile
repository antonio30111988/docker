FROM rabbitmq

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"

RUN rabbitmq-plugins enable --offline rabbitmq_management rabbitmq_management_agent rabbitmq_stomp

EXPOSE 15671 15672
