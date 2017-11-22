#!/bin/bash
set -eaux

# Uninstall old versions of docker
echo "Removing any old versions of docker..."
sudo apt-get remove -y docker docker-engine docker.io

ubuntu_version=$(lsb_release -cs)

function pre_trusty {
  echo "Installing aufs prerequisites for trusty"
  sudo apt-get -y install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
}

function pre_xenial {
  echo "Xenial has aufs. No installation required"
}

function pre_zesty {
  echo "Zesty has aufs. No installation required"
}

case "${ubuntu_version##*-}" in
  trusty) pre_trusty;;
  xenial) pre_xenial;;
  zesty) pre_zesty;;
  *) echo >&2 "unsupported ubuntu release: ${ubuntu_version}"; exit 1 ;;
esac;

echo "Adding Docker's GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Note need to verify key with sudo apt-key fingerprint 0EBFCD88


dpkg_arch="$(dpkg --print-architecture)";
case "${dpkg_arch##*-}" in
  amd64) ;;
  armhf) ;;
  arm64) ;;
  s390x) ;;
  *) echo >&2 "unsupported architecture: ${dpkg_arch}"; exit 1 ;;
esac;

echo "Adding docker's repository"
sudo add-apt-repository \
  "deb [arch=$dpkg_arch] https://download.docker.com/linux/ubuntu \
  $ubuntu_version -cs) \
  stable"

sudo apt-get update
sudo apt-get -y install docker-ce
sudo docker run hello-world

# sudo groupadd docker
sudo usermod -aG docker $USER
# Needs a restart to work
# docker run hello-world

