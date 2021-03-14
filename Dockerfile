FROM alpine:latest

RUN apk add --no-cache\
      sniproxy bash curl

ADD ./sniproxy.conf /etc/sniproxy/sniproxy.conf

EXPOSE 80 443

HEALTHCHECK --interval=1m --timeout=3s --retries=2 CMD \
  [[ "$(curl -o /dev/null -s -w "%{http_code}\n" http://localhost/)" == "503" ]]

CMD $(which sniproxy) -c /etc/sniproxy/sniproxy.conf -f
