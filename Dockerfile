# ------------------------------------
# Fast dockerized development environment
# ------------------------------------

FROM attachix/c9-esp8266-sdk:latest
MAINTAINER Slavey Karadzhov <slav@attachix.com>

COPY assets/welcome.html /cloud9/plugins/c9.ide.welcome/welcome.html
COPY assets/welcome.js /cloud9/plugins/c9.ide.welcome/welcome.js
COPY assets/keybindings.settings /workspace/

RUN apk add vim --update-cache --repository https://pkgs.alpinelinux.org/package/edge/main/x86_64/vim --allow-untrusted

RUN apk add nano --update-cache --repository https://pkgs.alpinelinux.org/package/edge/main/x86/nano --allow-untrusted

RUN git clone https://github.com/automacaoiot/ESP8266-SDK.git /workspace/AutomacaoIot

RUN git clone https://github.com/automacaoiot/Sming /workspace/Sming && cd /workspace/Sming && git checkout Feature/3.2.0-HttpMethods

RUN mkdir shared-workspace

ENV SMING_HOME /workspace/Sming/Sming
ENV SPI_SIZE 4MB
ENV SERIAL python -m serial.tools.miniterm /dev/ttyUSB0 115200

ENTRYPOINT /usr/bin/supervisord

VOLUME /workspace/shared-workspace
