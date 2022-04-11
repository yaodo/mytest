FROM golang:alpine AS builder
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux go build  -o myapp .
FROM scratch as final
COPY --from=0 /app/myapp .
CMD ["./myapp"]

