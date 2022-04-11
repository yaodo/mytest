FROM golang:1.18 as builder
RUN mkdir /app
WORKDIR /app
COPY . .
RUN GOOS=linux GOARCH=amd64  go build -o myapp .
FROM scratch as final
COPY --from=0 /app/myapp .
CMD ["./myapp"]

