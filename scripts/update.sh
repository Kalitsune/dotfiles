#!/bin/bash

# Pull any modifications from the repo
git pull -q

# Init the submodules
git submodule init
git submodule update
