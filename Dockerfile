FROM node:18.4-slim

ENV WRANGLER_VERSION="2.0.15"

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:${NPM_CONFIG_PREFIX}/bin
ENV NPM_CONFIG_CACHE=/home/node/cache
ENV WRANGLER_CONFIG_DIR=/config

RUN npm install -g wrangler@"$WRANGLER_VERSION" && \
  rm -rf "$NPM_CONFIG_CACHE" && \
  mkdir -p "$WRANGLER_CONFIG_DIR" && \
  touch "$WRANGLER_CONFIG_DIR"/wrangler.toml

ENTRYPOINT ["wrangler", "--config=/config/wrangler.toml"]
