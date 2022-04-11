MKFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

image-tag:
	git describe --always --dirty --exclude '*'
.PHONY: image-tag

docker-push:
	$(MKFILE_DIR)/docker-push.sh
.PHONY: docker-push
