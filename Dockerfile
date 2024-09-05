# build
FROM golang:1.23-alpine AS builder

WORKDIR /app

#COPY go.mod .
#COPY go.sum .
#RUN go mod download

COPY . .

RUN go build -o app cmd/api/main.golang

# run

FROM alpine:3.20.2

WORKDIR /app

COPY --from=builder /app/app .

CMD ["/app/app"]