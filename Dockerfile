# ------------------------------------
# Fast dockerized development environment 
# ------------------------------------

FROM attachix/c9-esp8266-sdk:latest
MAINTAINER Slavey Karadzhov <slav@attachix.com>

VOLUME /workspace

COPY assets/welcome.html /cloud9/plugins/c9.ide.welcome/welcome.html
COPY assets/welcome.js /cloud9/plugins/c9.ide.welcome/welcome.js
COPY assets/keybindings.settings /workspace/

RUN apk add vim --update-cache --repository https://pkgs.alpinelinux.org/package/edge/main/x86_64/vim --allow-untrusted

RUN apk add nano --update-cache --repository https://pkgs.alpinelinux.org/package/edge/main/x86/nano --allow-untrusted

RUN git clone https://github.com/automacaoiot/ESP8266-SDK.git /workspace/AutomacaoIot

RUN git clone https://github.com/SmingHub/Sming.git /workspace/Sming && cd /workspace/Sming && git checkout tags/3.2.0

ENV SMING_HOME /workspace/Sming/Sming

ENTRYPOINT /usr/bin/supervisord
