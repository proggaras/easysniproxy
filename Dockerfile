FROM ubuntu:hirsute

RUN apt update
RUN apt install -y sniproxy bash curl
RUN apt autoremove -y

RUN apt-get update && \
    apt-get install -y \
    apache2 \
    libapache2-modsecurity \
    iproute2 \
    git \
    curl \
    vim \
    ed \
    nano \
    python-pip && \
    apt-get autoremove -y

ADD ./sniproxy.conf /etc/sniproxy/sniproxy.conf

EXPOSE 80 443

HEALTHCHECK --timeout=3s CMD \
  [[ "$(curl -o /dev/null -s -w "%{http_code}\n" http://localhost/)" == "503" ]]

CMD $(which sniproxy) -c /etc/sniproxy/sniproxy.conf -f
