#!/bin/bash

set -eux

apt-get update
apt-get install -y --no-install-recommends ca-certificates gcc libc6-dev wget

url="https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init"
wget "$url"
chmod +x rustup-init
./rustup-init -y --no-modify-path --default-toolchain nightly
rm rustup-init
chmod -R a+w $RUSTUP_HOME $CARGO_HOME
rustup --version
cargo --version
rustc --version
apt-get remove -y --auto-remove wget
rm -rf /var/lib/apt/lists/*

echo "export RUSTUP_HOME=/usr/local/rustup" >> $HOME/.profile
echo "export CARGO_HOME=/usr/local/cargo" >> $HOME/.profile
echo "export PATH=/usr/local/cargo/bin:$PATH" >> $HOME/.profile