#!/bin/bash

# depends on software-properties-common

RUBY_VERSION=2.4.2

sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install -y rvm

# need to do true logout logback in
# sudo su --login camullen echo "gem: --no-document" | sudo tee --append /etc/gemrc && \
  # source /etc/profile.d/rvm.sh && \
  # rvm install $RUBY_VERSION && \
  # rvm alias mri $RUBY_VERSION && \
  # rvm alias default $RUBY_VERSION && \
  # gem install bundler byebug pry

