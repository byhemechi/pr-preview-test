FROM --platform=$BUILDPLATFORM golang:1.22 as build

WORKDIR /go/src/app
COPY ["go.mod", "server.go", "./"]

RUN go mod download
RUN go vet -v

ARG TARGETARCH
ARG TARGETOS
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /go/bin/app

FROM --platform=$TARGETPLATFORM gcr.io/distroless/static-debian11

COPY --from=build /go/bin/app /
CMD ["/app"]