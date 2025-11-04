FROM golang:1.23-alpine AS builder
WORKDIR /app
COPY ./webcal-proxy .
RUN go build -o webcal-proxy ./cmd/webcal-proxy

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/webcal-proxy .
EXPOSE 8080
CMD ["./webcal-proxy", "-addr", ":8080"]