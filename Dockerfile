# Copyright (c) 2026 VEXXHOST, Inc.
# SPDX-License-Identifier: Apache-2.0

FROM golang:1.26.3@sha256:2d6c80227255c3112a4d08e67ba98e58efd3846daf15d9d7d4c389565d881b1a AS builder
WORKDIR /src
COPY go.mod go.sum /src/
RUN go mod download
COPY . /src
RUN CGO_ENABLED=0 go build -o /openstack-database-exporter ./cmd/openstack-database-exporter

FROM scratch
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /openstack-database-exporter /bin/openstack-database-exporter
EXPOSE 9180
ENTRYPOINT ["/bin/openstack-database-exporter"]
