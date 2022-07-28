FROM golang:1.7.4-alpine3.5 as build
WORKDIR /app
COPY go . 

RUN CGO_ENABLED=0 GOOS=linux go build codeeducation.go

FROM scratch
WORKDIR /app
COPY --from=build /app .

ENTRYPOINT ["./codeeducation"]