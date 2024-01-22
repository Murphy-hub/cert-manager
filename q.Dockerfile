FROM harbor.oneitfarm.com/bifrost/base-ubuntu:20.04

WORKDIR /cert-manager

COPY ./bin/cert-manager .
RUN chmod +x cert-manager

ENTRYPOINT ["./cert-manager"]