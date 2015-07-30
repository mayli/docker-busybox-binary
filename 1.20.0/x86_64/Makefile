IMAGE_NAME := docker-busybox-binary
IMAGE_VERSION := $(shell basename $(shell dirname $(shell pwd -L)))
IMAGE_ARCH := $(shell basename $(shell pwd -L))
IMAGE_TAG := $(IMAGE_VERSION)_$(IMAGE_ARCH)

.PHONY: all build stop clean

all: build

build: busybox
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
	if [ "$(IMAGE_TAG)" = "latest_x86_64" ]; then docker tag -f $(IMAGE_NAME):$(IMAGE_TAG) $(IMAGE_NAME):latest; fi

busybox:
	echo Downloading busybox $(IMAGE_VERSION) $(IMAGE_ARCH)
	wget -c -O busybox http://www.busybox.net/downloads/binaries/$(IMAGE_VERSION)/busybox-$(IMAGE_ARCH)
	chmod +x busybox

clean:
	rm -rf busybox
	docker images $(IMAGE_NAME) | grep -q $(IMAGE_TAG) && docker rmi $(IMAGE_NAME):$(IMAGE_TAG) || true
	docker images $(IMAGE_NAME) | grep -q latest && docker rmi $(IMAGE_NAME):latest || true
