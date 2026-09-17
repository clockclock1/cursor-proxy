# syntax=docker/dockerfile:1.7
FROM debian:stable-slim
ARG TARGETARCH
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl && rm -rf /var/lib/apt/lists/*
COPY --chmod=755 dist/cursor-proxy-linux-${TARGETARCH} /usr/local/bin/cursor-proxy
COPY .env.example /app/.env.example
ENV HOST=0.0.0.0 PORT=3100 DATA_DIR=/app/.data
EXPOSE 3100
VOLUME ["/app/.data"]
ENTRYPOINT ["cursor-proxy"]
