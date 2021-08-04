#!/bin/sh
set -xe

# Node.js repo
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - 
echo "deb https://deb.nodesource.com/node_${NODE_VERSION} jessie main" | tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/node_${NODE_VERSION} jessie main" | tee -a /etc/apt/sources.list.d/nodesource.list

# yarn repo
wget -qO - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update >/dev/null
apt-get -y --no-install-recommends install nodejs yarn
apt-get clean
rm -rf /var/lib/apt/lists/*
