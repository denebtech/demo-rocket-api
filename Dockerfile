# stage #1: build application
FROM rust:1.87.0-slim-bullseye AS builder

WORKDIR /app

COPY Cargo.toml Cargo.lock ./
COPY src ./src

RUN cargo build --release

# stage #2: create the runtime image
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -r -s /bin/false appuser

WORKDIR /app

COPY --from=builder /app/target/release/demo-rocket-api .

RUN chown appuser:appuser /app/demo-rocket-api

USER appuser

ENV ROCKET_ADDRESS=0.0.0.0
ENV ENVIRONMENT="Undefined"
EXPOSE 8000

CMD ["./demo-rocket-api"]
