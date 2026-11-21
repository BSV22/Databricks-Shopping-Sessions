FROM rust:1.85-slim-bookworm AS builder

WORKDIR /app
COPY Cargo.toml Cargo.lock ./
COPY src ./src
RUN cargo build --release

FROM debian:bookworm-slim

WORKDIR /data
COPY --from=builder /app/target/release/generate /usr/local/bin/generate
ENTRYPOINT ["generate"]
CMD ["--seed", "1", "--events", "1000000", "--clicks", "250000", "--output", "/data/dev"]
