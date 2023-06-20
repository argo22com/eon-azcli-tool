FROM mcr.microsoft.com/azure-cli:latest

RUN apk upgrade -U && \
    apk --update add --no-cache \
    iptables \
    inetutils-telnet && \
    \
    adduser -Du 1000 azcli

USER azcli

WORKDIR /home/azcli

COPY ./script/init ./init
COPY ./script/tunnel ./tunnel

CMD ["tail", "-f", "/dev/null"]
