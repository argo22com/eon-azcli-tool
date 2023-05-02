FROM mcr.microsoft.com/azure-cli:latest

RUN adduser -Du 1000 azcli

USER azcli

WORKDIR /home/azcli

CMD ["tail", "-f", "/dev/null"]
