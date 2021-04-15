FROM alpine:latest

RUN	apk update \
	&& apk add sniproxy

ADD ./sniproxy.conf /etc/sniproxy.conf

EXPOSE 80 443

HEALTHCHECK --timeout=3s CMD \
  [[ "$(curl -o /dev/null -s -w "%{http_code}\n" http://localhost/)" == "503" ]]

CMD $(which sniproxy) -c /etc/sniproxy.conf -f
