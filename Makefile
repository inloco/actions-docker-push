MKFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

image-tag:
	test "$(IMAGE_TAG)" = 'commit-sha' && git describe --always --dirty --exclude '*' || printf "$(IMAGE_TAG)"
.PHONY: image-tag

docker-push:
	$(MKFILE_DIR)/docker-push.sh
.PHONY: docker-push
