#!/usr/bin/env sh

set -x
mysql -h host.docker.internal -u root magic < demo.sql
