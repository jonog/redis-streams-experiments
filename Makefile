
build:
	docker build -t redis-streams .

network:
	docker network create redis-streams-experiment

start-server:
	docker run -d --network=redis-streams-experiment --name redis-streams redis-streams:latest

cli:
	docker run --rm -it --network=redis-streams-experiment redis-streams:latest redis-cli -h redis-streams

run-demo-xadd:
	cat demo-xadd.txt | docker run --rm -i --network=redis-streams-experiment redis-streams:latest redis-cli -h redis-streams

cleanup-server:
	TO_CLEANUP=$(shell docker ps -a -f name=redis-streams -q); \
	docker rm -f $$TO_CLEANUP

cleanup-network:
	docker network rm redis-streams-experiment

cleanup: cleanup-server cleanup-network

.PHONY: build network start-server cli run-demo-xadd cleanup
