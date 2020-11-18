#!/usr/bin/env puma

environment 'development'

bind 'tcp://0.0.0.0:3000'

tag 'Puma Server for Interflux API (development)'

# Development often hangs unless you do this:
# https://github.com/rails/rails/issues/33209
workers 1
threads 1, 1

# Timeout after 10 minutes
worker_timeout 600
