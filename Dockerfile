FROM openjdk:9-b181-jdk

COPY batch /usr/local/weave/batch/
COPY bin /usr/local/weave/bin/
COPY service /usr/local/weave/service/
COPY hsqldb /usr/local/weave/hsqldb/
COPY zk /usr/local/weave/zk/
RUN ls -lar /usr/local/weave/*
RUN chmod 755 /usr/local/weave/bin/start-service-app.sh

COPY service-app-entrypoint.sh /service-app-entrypoint.sh
RUN chmod 755 /service-app-entrypoint.sh

ENTRYPOINT ["/service-app-entrypoint.sh"]