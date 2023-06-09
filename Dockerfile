## Build
FROM golang:1.16-buster AS builder

WORKDIR /app

COPY go.* ./

RUN go mod download

COPY *.go ./

RUN go build -o /full-cycle-rocks

## Deploy
FROM scratch

WORKDIR /app

COPY --from=builder /full-cycle-rocks /full-cycle-rocks

ENTRYPOINT [ "/full-cycle-rocks" ]
