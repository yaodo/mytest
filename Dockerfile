FROM golang as builder
RUN mkdir /app
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build .
FROM scratch as final
COPY --from=builder /app/publish .
CMD ["./myapp"]

