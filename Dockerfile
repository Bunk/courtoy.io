FROM alpine:edge
MAINTAINER JD Courtoy <jd@courtoy.io>

ARG plugins=http.git

RUN apk add --no-cache openssh-client git tar curl

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/linux/amd64?plugins=${plugins}" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

EXPOSE 80 443 2015
VOLUME /root/.caddy
WORKDIR /srv

ENV CADDY_FILE /etc/Caddyfile
COPY Caddyfile /etc/Caddyfile

ENTRYPOINT [ "/usr/bin/caddy" ]
CMD [ "--conf", "/etc/Caddyfile", "--log", "stdout", "--agree" ]
