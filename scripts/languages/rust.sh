#!/bin/bash

# Install rust
echo -e "${NEUTRAL}Installing Rust...${BLANK}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -qy

