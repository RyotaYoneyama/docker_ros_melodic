.PHONY: help
.DEFAULT_GOAL := help


help: ## Help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


build_noetic: ## Build noetic docker image
	@echo Start building noetic docker image.
	docker build -f Ubuntu/noetic/Dockerfile -t ubuntu-noetic Ubuntu/
	@echo Finished build_noetic noetic docker image.

build_melodic: ## Build melodic docker image
	@echo Start building melodic docker image.
	docker build -f Ubuntu/melodic/Dockerfile -t ubuntu-melodic Ubuntu/
	@echo Finished build_melodic melodic docker image.


run_noetic: ## Run noetic container without devices
	@echo Start running noetic docker container without devices.
	docker run -it --privileged --net host --ipc host \
        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$(DISPLAY) \
        -e LOCAL_UID=`id -u $(USER)` -e LOCAL_GID=`id -g $(USER)` \
        -v $(SRC):/home/ubuntu/catkin_ws/src/ \
        --name noetic_no_divice \
		ubuntu-noetic:latest bash

run_noetic_device: ## Run noetic container with a device
	@echo Start running noetic docker container witha a device.
	docker run -it --privileged --net host --ipc host \
	        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$(DISPLAY) \
	        -e LOCAL_UID=`id -u $(USER)` -e LOCAL_GID=`id -g $(USER)` \
	        -v $(SRC):/home/ubuntu/catkin_ws/src/ \
	        -e LOCAL_DEVICE=$(DEVICE) \
	        --device /dev/$(DEVICE):/dev/$(DEVICE) \
	        --name noetic_with_divice \
			ubuntu-noetic:latest bash

run_melodic: ## Run melodic container without devices
	@echo Start running melodic docker container without devices.
	docker run -it --privileged --net host --ipc host \
        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$(DISPLAY) \
        -e LOCAL_UID=`id -u $(USER)` -e LOCAL_GID=`id -g $(USER)` \
        -v $(SRC):/home/ubuntu/catkin_ws/src/ \
        --name melodic_no_divice \
		ubuntu-melodic:latest bash

run_melodic_device: ## Run melodic container with a device
	@echo Start running melodic docker container witha a device.
	docker run -it --privileged --net host --ipc host \
	        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$(DISPLAY) \
	        -e LOCAL_UID=`id -u $(USER)` -e LOCAL_GID=`id -g $(USER)` \
	        -v $(SRC):/home/ubuntu/catkin_ws/src/ \
	        -e LOCAL_DEVICE=$(DEVICE) \
	        --device /dev/$(DEVICE):/dev/$(DEVICE) \
	        --name melodic_with_divice \
			ubuntu-melodic:latest bash