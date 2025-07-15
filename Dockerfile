FROM golang:1.24 AS base
WORKDIR /app
COPY . .
RUN make build

FROM golang:1.24-alpine AS runner
WORKDIR /app

RUN addgroup --system --gid 1001 golang
RUN adduser --system --uid 1001 golang
USER golang

COPY --from=base --chown=golang:golang /app/bin/sse .
CMD ["./sse"]
