#!/bin/sh
set -e

# Generate the Caddyfile based on the following heredoc template
export DNS_SEARCH=`cat /etc/resolv.conf | head -n 1 | cut -d' ' -f2`

exec $@
