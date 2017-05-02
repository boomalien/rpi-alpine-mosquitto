FROM hypriot/rpi-alpine

LABEL Description="Eclipse Mosquitto MQTT Broker. This Image uses the hypriot/rpi-alpine as base image"

RUN apk update && \
    apk upgrade
    
RUN apk add mosquitto=1.4.10-r2 && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config && \
    chown -R mosquitto:mosquitto /mosquitto && \
    rm -rf /var/cache/apk/*
   
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh 
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
