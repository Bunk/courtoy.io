FROM abiosoft/caddy
MAINTAINER JD Courtoy <jd@courtoy.io>

ENV CADDY_FILE /etc/Caddyfile
COPY caddyfile /etc/Caddyfile

ENTRYPOINT [ "/usr/bin/caddy" ]
CMD [ "--conf", "/etc/Caddyfile", "--log", "stdout", "--agree" ]
