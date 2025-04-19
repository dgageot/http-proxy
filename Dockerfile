
# syntax=docker/dockerfile:1
# check=experimental=all
FROM golang:1.24.2-alpine@sha256:7772cb5322baa875edd74705556d08f0eeca7b9c4b5367754ce3f2f00041ccee AS builder

RUN --mount=type=cache,target=/root/.cache/go-build \
    --mount=type=bind,target=. \
    go build -o /proxy .


FROM alpine@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c
COPY --from=builder /proxy /
EXPOSE 8080
ENV ALLOWED_HOSTS=
ENTRYPOINT ["/proxy"]