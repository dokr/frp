PWD := $(shell pwd)

PKG := github.com/fatedier/frp
IMAGE_NAME := ckeyer/frp
CLIENT_TAG := c
SERVER_TAG := s
DEV_IMAGE := ckeyer/dev:go
GOBIN := /opt/bundle

image: build
	docker build -t $(IMAGE_NAME) .

build:
	docker run --rm \
	 -v $(PWD):/opt \
	 -w /opt \
	 -e CGO_ENABLED=0 \
	 -e GOBIN=$(GOBIN) \
	 $(DEV_IMAGE) make local

local: clean
	go get $(PKG)/cmd/...

clean:
	-rm -rf ./bundle