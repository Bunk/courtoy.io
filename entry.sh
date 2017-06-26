#!/bin/sh
set -e

# Generate the Caddyfile based on the following heredoc template
search=`cat /etc/resolv.conf | head -n 1 | cut -d' ' -f2`
cat >${CADDY_FILE} <<EOF
jd.courtoy.io {
    proxy /blog proxy.blog.${search} {
        transparent
    }

    proxy /resume web.resume.${search}:8080 {
        transparent
    }
    
    expvar /stats

    tls jd@courtoy.io
}
EOF

exec $@
