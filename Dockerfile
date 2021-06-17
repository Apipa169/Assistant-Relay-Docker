ARG ASSISTANT_RELAY_VER=3.2.0

ARG NODE_BASE_VER=15.6.0-alpine3.12
ARG PM2_VER=4.5.1

# Create our build-base image
FROM node:${NODE_BASE_VER} as build-base

RUN apk --no-cache --update add \
    python3 \
    build-base


# Build the pm2 production modules
FROM build-base as build-pm2
ARG PM2_VER

RUN mkdir -p /tmp/npm-modules-to-copy /tmp/pm2-install

WORKDIR /tmp/pm2-install

RUN npm install pm2@${PM2_VER} --loglevel verbose --only=production \
    && cp -R ./node_modules/* /tmp/npm-modules-to-copy


# Build full pm2 stack globally and install assistant-relay production modules on top
FROM build-base as build-assistant
ARG ASSISTANT_RELAY_VER
ARG PM2_VER

RUN mkdir -p /tmp/npm-modules-to-copy /tmp/assisant-relay-install

RUN npm install pm2@${PM2_VER} --loglevel verbose --global

WORKDIR /tmp/assisant-relay-install

RUN wget "https://github.com/greghesp/assistant-relay/releases/download/v${ASSISTANT_RELAY_VER}/release.zip" \
    && unzip release.zip \
    && rm release.zip \
    && npm install --loglevel verbose --only=production \
    && cp -R ./node_modules/* /tmp/npm-modules-to-copy


# Finally, copy the necessary artefacts into the main image and add the deps and assistant-relay code
FROM node:${NODE_BASE_VER}
ARG ASSISTANT_RELAY_VER

RUN apk --no-cache --update add \
    python3 \
    py3-pip

RUN mkdir -p /opt/assistant_relay/bin \
    && touch /opt/assistant_relay/bin/config.json \
    && chown node:node /opt/assistant_relay/bin/config.json

WORKDIR /opt/assistant_relay

RUN wget "https://github.com/greghesp/assistant-relay/releases/download/v${ASSISTANT_RELAY_VER}/release.zip" \
    && unzip release.zip \
    && rm release.zip

COPY --from=build-pm2 /tmp/npm-modules-to-copy ./node_modules/
COPY --from=build-assistant /tmp/npm-modules-to-copy ./node_modules/

ENV PATH="/opt/assistant_relay/node_modules/pm2/bin:${PATH}"

USER node

CMD ["pm2-runtime", "start", "./bin/www"]
