ARG BUILD_FROM
FROM node

ENV LANG C.UTF-8
ENV VERSION=$VERSION
ENV BUILD_DATE=$BUILD_DATE
ENV jwtSecret=Assistant-Relay-2020

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install -y git
RUN apt-get install -y python3-pip
RUN pip3 install catt

RUN git clone -b v4 https://github.com/greghesp/assistant-relay
WORKDIR /assistant-relay
RUN npm i pm2 -g
RUN npm i

WORKDIR /
COPY run.sh /run.sh
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
