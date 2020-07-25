FROM rust:1.45 as builder
WORKDIR /usr/src/hello-warp
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
RUN apt-get update && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/hello-warp /usr/local/bin/hello-warp
CMD ["hello-warp"]

