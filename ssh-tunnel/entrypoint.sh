#!/bin/sh

chown -R root /opt/ssh && chmod 600 /opt/ssh/*

exec "$@"
