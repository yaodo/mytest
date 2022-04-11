FROM golang:alpine AS builder
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux go build  -o myapp .
FROM alpine:latest as prod
RUN apk --no-cache add ca-certificates
FROM scratch as final
COPY --from=build /app/myapp .
CMD ["/myapp"]
