FROM golang:1.17 as builder

ENV GOPROXY=https://goproxy.io,direct
WORKDIR /app 
COPY . .
RUN CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o echo-host main.go

FROM ubuntu:18.04 as runner

WORKDIR /app
COPY --from=builder /app/echo-host .
EXPOSE 8080
CMD ["./echo-host"]
