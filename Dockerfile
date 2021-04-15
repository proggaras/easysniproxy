FROM alpine:latest

RUN apk add --no-cache\
      sniproxy bash curl

ADD ./sniproxy.conf /etc/sniproxy.conf

EXPOSE 80 443

HEALTHCHECK --timeout=3s CMD \
  [[ "$(curl -o /dev/null -s -w "%{http_code}\n" http://127.0.0.1/)" == "503" ]]

CMD $(which sniproxy) -c /etc/sniproxy.conf -f
