ROOT := $(shell pwd)
DOCKIMAGE 		?= cplayground
DOCKCONTAINER ?= cplayground
SYNCHOST			?= $(ROOT)
SYNCDOCK			?= /work/sync

docker-build-image:
	@sudo docker build -t $(DOCKIMAGE) .

docker-run:
	@sudo docker run -v $(SYNCHOST):$(SYNCDOCK) --name $(DOCKCONTAINER) -td $(DOCKIMAGE) /bin/bash

docker-attatch:
	@sudo docker exec -it $(DOCKCONTAINER) /bin/fish

docker-clean:
	@sudo docker container stop $(DOCKCONTAINER); \
		sudo docker container rm $(DOCKCONTAINER)
