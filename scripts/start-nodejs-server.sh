#!/bin/sh
# -
cd /vagrant/projects/nn-bancassurance-nodejs-proxy
nohup node api-proxy.js 2>&1 &