FROM abiosoft/caddy
MAINTAINER JD Courtoy <jd@courtoy.io>

ENV CADDY_FILE /etc/Caddyfile
COPY caddyfile /etc/Caddyfile

CMD [ "/usr/bin/caddy", "-conf /etc/Caddyfile", "-log stdout", "-agree" ]
