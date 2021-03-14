FROM alpine:latest

RUN apk add --no-cache\
      sniproxy vim wget bash iputils 

ADD ./sniproxy.conf /etc/sniproxy/sniproxy.conf


WORKDIR /root

CMD $(which sniproxy) -c /etc/sniproxy.conf -f
