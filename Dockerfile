FROM ubuntu:hirsute

RUN apt-get update && \
    apt-get install -y \
    sniproxy \
    bash \
    curl && \
    apt-get autoremove -y

ADD ./sniproxy.conf /etc/sniproxy/sniproxy.conf

EXPOSE 80 443

HEALTHCHECK --timeout=3s CMD \
  [[ "$(curl -o /dev/null -s -w "%{http_code}\n" http://localhost/)" == "503" ]]

CMD $(which sniproxy) -c /etc/sniproxy/sniproxy.conf -f
