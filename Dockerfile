FROM golang:1.10-alpine3.8 AS build

WORKDIR /build

# Compile our helloworld executable
ADD main.go .
RUN go build -o helloworld

# ---------

FROM alpine:3.8

WORKDIR /

# Copy the helloworld executable from the build phase
COPY --from=build /build/helloworld /

# Add our static content
ADD content /content

EXPOSE 8080

ENTRYPOINT ["/helloworld"]
