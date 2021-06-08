FROM golang:1.16.4-alpine3.13 AS buildStage

RUN apk add --no-cache git

WORKDIR  /tmp/helloworld

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN go build -o ./build/helloworld .

FROM alpine:3.13
RUN apk add ca-certificates 


COPY --from=buildStage /tmp/helloworld/build/helloworld /app/helloworld

ENTRYPOINT [ "/app/helloworld" ]
