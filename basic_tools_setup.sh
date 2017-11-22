#!/bin/bash

basic_packages="git wget curl tar xz-utils unzip zip vim nano ca-certificates
software-properties-common tmux gzip bzip2 apt-utils apt-transport-https rsync
gnupg2 man"

build_pacakges="build-essential"
python_packages="python python3 python-pip python3-pip"

sudo apt-get install -y --no-install-recommends --no-install-suggests \
  $basic_packages \
  $build_pacakges \
  $python_packages


