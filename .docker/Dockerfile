FROM mcr.microsoft.com/azure-cli:latest

RUN apk upgrade -U && \
    apk --update add --no-cache \
    iptables \
    inetutils-telnet && \
    \
    adduser -Du 1000 azcli

USER azcli

WORKDIR /home/azcli

CMD ["tail", "-f", "/dev/null"]
