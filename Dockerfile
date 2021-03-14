FROM alpine:latest

RUN apk add --no-cache\
      sniproxy bash 

ADD ./sniproxy.conf /etc/sniproxy/sniproxy.conf

EXPOSE 80 443
CMD $(which sniproxy) -c /etc/sniproxy/sniproxy.conf -f
