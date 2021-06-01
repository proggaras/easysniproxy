FROM alpine:latest

RUN apk add --no-cache\
      sniproxy bash curl

ADD ./sniproxy.conf /etc/sniproxy.conf

EXPOSE 80 443

HEALTHCHECK --timeout=3s CMD \
  curl --fail -H "Host: pm.me" --silent http://127.0.0.1/ || exit 1

CMD $(which sniproxy) -c /etc/sniproxy.conf -f
