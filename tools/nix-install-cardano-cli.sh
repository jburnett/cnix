#!/bin/bash

# copied from https://hydra.iohk.io/build/7774194
nix-env -i /nix/store/0yhf9s8krd0bhsav1r7wkaypvhhghiq3-cardano-cli-exe-cardano-cli-x86_64-unknown-linux-musl-1.30.0 --option binary-caches https://iohk-nix-cache.s3-eu-central-1.amazonaws.com/
