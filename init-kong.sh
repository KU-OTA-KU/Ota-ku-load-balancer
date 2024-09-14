#!/bin/sh
# chmod +x init-kong.sh
kong migrations bootstrap
kong reload
