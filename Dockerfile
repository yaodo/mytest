FROM golang:1.18 as builder
RUN mkdir /app
WORKDIR /app
COPY . .
RUN GOOS=linux GOARCH=amd64  go build .
FROM scratch as final
COPY --from=builder /app/myapp .
CMD ["./myapp"]

