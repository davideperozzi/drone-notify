FROM spritsail/alpine:3.13

ARG NOTIFY_VER=1.1

LABEL maintainer="Adam Dodman <dronenotify@adam-ant.co.uk>" \
      org.label-schema.vendor="Adam Dodman" \
      org.label-schema.name="Drone Notify" \
      org.label-schema.url="https://github.com/Adam-Ant/DroneWebhookNotify" \
      org.label-schema.description="Turn Drone global webhooks into Telegram notifications" \
      org.label-schema.version=${NOTIFY_VER}

WORKDIR /app/

COPY requirements.txt /app/

RUN apk add --no-cache py3-pip \
 && pip3 install -r requirements.txt

COPY --chmod=755 main.py /app/

VOLUME ["/config"]

CMD ["/usr/bin/python3", "-u", "/app/main.py", "/config/notify.conf"]
