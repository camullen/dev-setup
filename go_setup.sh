#!/bin/bash

VERSION=1.9.2
OS=linux
ARCH=amd64
CHECKSUM=665f184bf8ac89986cfd5a4460736976f60b57df6b320ad71ad4cef53bb143dc

wget https://redirector.gvt1.com/edgedl/go/go$VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/Developer/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc


rm go$VERSION.$OS-$ARCH.tar.gz

# user needs to source their bashrc for go to be on the path
