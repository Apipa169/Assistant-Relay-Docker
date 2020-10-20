ARG BUILD_FROM
FROM node

ENV LANG C.UTF-8
ENV VERSION=$VERSION
ENV BUILD_DATE=$BUILD_DATE

RUN mkdir -p /assistant_relay/bin \
&& touch /assistant_relay/bin/config.json \
&& npm i pm2 -g

WORKDIR /assistant_relay

RUN wget https://github.com/greghesp/assistant-relay/releases/download/v3.2.0/release.zip \
&& unzip release.zip \
&& rm release.zip \
&& npm i

WORKDIR /
RUN wget https://raw.githubusercontent.com/Apipa169/Assistant-Relay-Docker/master/run.sh
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
