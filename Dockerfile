FROM alpine:latest

RUN apk add --no-cache\
      sniproxy bash 

ADD ./sniproxy.conf /etc/sniproxy/sniproxy.conf

EXPOSE 80 443

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

CMD $(which sniproxy) -c /etc/sniproxy/sniproxy.conf -f
