ARG BUILD_FROM
FROM node:lts-alpine

ENV LANG C.UTF-8


RUN mkdir /assistant_relay \
&& npm i pm2 -g

WORKDIR /assistant_relay

RUN wget https://github.com/greghesp/assistant-relay/releases/download/v3.1.3/release.zip \
&& unzip release.zip \
&& rm release.zip \
&& npm i

WORKDIR /
RUN wget https://raw.githubusercontent.com/Apipa169/Assistant-Relay-Docker/master/run.sh
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]