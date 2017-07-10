#!/bin/bash

chown -R puppet:puppet /etc/puppetlabs/puppet/ssl
chown -R puppet:puppet /opt/puppetlabs/server/data/puppetserver/

export LANG=en_US.UTF-8

exec /opt/puppetlabs/bin/puppetserver "$@"
