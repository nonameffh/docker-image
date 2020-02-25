FROM nonameffh/alpine:latest

LABEL maintainer="Aleksey Tarasov <nonameffh@gmail.com>"

ENV FQDN="vpn.example.com"
ENV container=docker

RUN apk add openvpn easy-rsa iptables openssl opensc

COPY openvpn/ /etc/openvpn/
COPY bin/* /usr/local/bin/
RUN chmod a+x /usr/local/bin/*

EXPOSE 1194/udp

CMD ["ovpn-run"]