# generate: the Shopping Sessions dataset generator

Needs Rust 1.85 or newer.

    cargo build --release
    target/release/generate --seed 1 --events 1000000 --clicks 250000 --output dev   # the public dev set

Then copy target/release/generate onto your PATH so the starter's `make dev` finds it.

To build and run it with Docker:

    docker build -t shopping-sessions-generator .
    docker run --rm -v "$PWD/dev:/data/dev" shopping-sessions-generator --seed 1 --events 1000000 --clicks 250000 --output /data/dev
