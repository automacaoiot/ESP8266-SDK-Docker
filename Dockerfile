# ------------------------------------
# Fast dockerized development environment 
# ------------------------------------
FROM attachix/c9-esp8266-sdk:latest
MAINTAINER Slavey Karadzhov <slav@attachix.com>

COPY assets/welcome.html /cloud9/plugins/c9.ide.welcome/welcome.html
COPY assets/welcome.js /cloud9/plugins/c9.ide.welcome/welcome.js

RUN git clone https://github.com/SmingHub/Sming.git /workspace/Sming 

RUN cd /workspace/Sming

RUN git checkout -b compatibleVersion e2407893d8eaaf304503393d5ef5686c4c38bb8b

ENV SMING_HOME /workspace/Sming/Sming

ENTRYPOINT /usr/bin/supervisord
