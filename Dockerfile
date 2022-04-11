FROM golang:alpine as builder
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o myapp
FROM alpine as final
COPY --from=0 /app/myapp .
CMD ["./myapp"]

