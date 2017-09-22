# ------------------------------------
# Fast dockerized development environment 
# ------------------------------------

FROM attachix/c9-esp8266-sdk:latest
MAINTAINER Slavey Karadzhov <slav@attachix.com>

COPY assets/welcome.html /cloud9/plugins/c9.ide.welcome/welcome.html
COPY assets/welcome.js /cloud9/plugins/c9.ide.welcome/welcome.js
COPY assets/keybindings.settings ~/.c9/keybindings.settings
COPY assets/keybindings.settings workspace/.c9/keybindings.settings

RUN git clone -b 3.2.0 https://github.com/SmingHub/Sming.git /workspace/Sming

# RUN git clone https://github.com/automacaoiot/ES8266-SDK.git /workspace/Automacaoiot

ENV SMING_HOME /workspace/Sming/Sming

ENTRYPOINT /usr/bin/supervisord
