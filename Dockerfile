FROM golang:1.17.8-alpine AS builder

ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct

WORKDIR /build

COPY . .
RUN CGO_ENABLED=0 go build -o cert-manager ./cmd/controller

FROM ubuntu:20.04

WORKDIR /cert-manager

COPY --from=builder /build/cert-manager .
RUN chmod +x cert-manager

ENTRYPOINT ["./cert-manager"]