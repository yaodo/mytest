FROM golang:alpine as builder

RUN apk --no-cache add git

WORKDIR /go/src/

RUN go get -d -v github.com/go-sql-driver/mysql

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest as prod

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=0 /go/src/app .

CMD ["./app"]
