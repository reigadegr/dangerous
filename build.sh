#!/bin/bash
mkdir -p output
rm -rf output/*
# cargo b -r --target aarch64-linux-android
cargo +nightly ndk -p 34 -t arm64-v8a build --target aarch64-linux-android -Z build-std --release
cd output
cp -r ../module/* .
dd if=../target/aarch64-linux-android/release/dangerous of=./dangerous
strip ./dangerous
zip -9 -rq dangerous.zip .
