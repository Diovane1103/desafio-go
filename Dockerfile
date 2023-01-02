# stage de build
FROM golang:1.19 AS builder
WORKDIR /app
COPY /go /app
RUN CGO_ENABLED=0 GOOS=linux go build -o api hello.go
# stage imagem final
FROM scratch
WORKDIR /app
COPY --from=builder /app/api ./
CMD [ "./api" ]