FROM golang:1.23-alpine AS build
WORKDIR /src
COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /dash .

FROM alpine:3.20
COPY --from=build /dash /dash
VOLUME /data
EXPOSE 8080
ENTRYPOINT ["/dash"]
