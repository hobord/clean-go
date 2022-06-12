-include .env

GITHASH = $(GITHUB_SHA)
ifndef GITHUB_SHA
	GITHASH = $(shell git rev-list -1 HEAD)
endif

VERSION = $(GITHUB_REF)
ifndef GITHUB_REF
	VERSION = $(shell git describe --tags)
endif

# Use linker flags to provide version/build settings
LDFLAGS=-ldflags "\
	-X 'github.com/xxxx/yyyy/apps.GitHash=$(GITHASH)' \
	-X 'github.com/xxxx/yyyy/apps.Version=$(VERSION)'"


PROTOS_PATH = delivery/protobuf
PROTOS_GO_PATH = delivery/protobuf/go

# Make is verbose in Linux. Make it silent.
MAKEFLAGS += --silent

.DEFAULT_GOAL := default

configure:
	go env -w GOPRIVATE="github.com/xxxxx"
	go mod tidy

mocks:
	go generate ./...

proto:
	protoc \
    --proto_path=$(PROTOS_PATH) \
    --twirp_out=${PROTOS_GO_PATH} \
    --go_out=plugins=grpc:${PROTOS_GO_PATH}

test:
	go test -tags=unit ./... -race

integration_test:
	go test -tags=integration ./... -race

coverage:
	gocov test ./... | gocov-xml > coverage.xml

build:
	go build $(LDFLAGS) -o bin/app cmd/main.go


