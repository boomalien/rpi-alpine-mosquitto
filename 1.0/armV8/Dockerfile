FROM arm64v8/alpine:latest
COPY qemu-aarch64-static /usr/bin/
LABEL Description="Eclipse Mosquitto MQTT Broker. This Image uses the hypriot/rpi-alpine as base image"

RUN apk update && \
    apk upgrade
    
RUN apk add mosquitto=1.4.15-r3 && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config && \
    chown -R mosquitto:mosquitto /mosquitto && \
    rm -rf /var/cache/apk/*
   
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh 
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
