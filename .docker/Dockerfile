FROM mcr.microsoft.com/azure-cli:latest

RUN apk upgrade -U && \
    apk --update add --no-cache \
    inetutils-telnet && \
    \
    adduser -Du 1000 azcli

USER azcli

WORKDIR /home/azcli

COPY ./script/init ./init
COPY ./script/tunnel ./tunnel

CMD init
