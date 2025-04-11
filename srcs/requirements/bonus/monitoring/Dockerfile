FROM alpine:3.20.6

RUN apk update && apk upgrade && \
    apk add --no-cache \
    curl bash vim

ENV PROMETHEUS_VERSION 2.53.4

RUN curl -LO https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz && \
    tar xvf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz && \
    mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus /bin/ && \
    mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/promtool /bin/ && \
    rm -rf prometheus-${PROMETHEUS_VERSION}.linux-amd64*  # Limpar os arquivos temporários

RUN mkdir -p /etc/prometheus /var/lib/prometheus

COPY ./conf/prometheus.yml /etc/prometheus/prometheus.yml

EXPOSE 9090

CMD ["/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/var/lib/prometheus/", "--web.listen-address=:9090"]


# FROM alpine:3.20.6

# RUN apk update && apk upgrade && \
#     apk add --no-cache \
#     git vim curl \
#     docker-cli \
#     docker-compose \
#     bash

# WORKDIR /home/monitoring

# COPY ./conf/docker-compose.yml /home/monitoring/
# COPY ./conf/prometheus.yml /home/monitoring/
# COPY ./tools/start-monitoring.sh /home/monitoring/

# RUN chmod +x /home/monitoring/start-monitoring.sh

# EXPOSE 7777

# ENTRYPOINT ["/home/monitoring/start-monitoring.sh"]

# FROM alpine:3.20.6

# RUN apk update && apk upgrade && \
#     apk add --no-cache \
#     git vim curl \
#     docker-cli \
#     docker-compose \
#     bash

# RUN docker-compose --version
# WORKDIR /home/monitoring

# COPY ./conf/docker-compose.yml /home/monitoring/
# COPY ./conf/prometheus.yml /home/monitoring/

# COPY ./tools/start-monitoring.sh /home/monitoring/

# RUN chmod +x /home/monitoring/start-monitoring.sh


# EXPOSE 7777

# ENTRYPOINT ["/home/monitoring/start-monitoring.sh"]
