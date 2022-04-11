FROM golang:alpine as builder
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN GOOS=linux GOARCH=amd64  go build -o myapp .
FROM scratch as final
COPY --from=0 /app/myapp .
CMD ["./myapp"]

