.PHONY: build run down request

build:
	docker-compose build

run:
	docker-compose up

down:
	docker-compose down

request: # call nginx using POST with the request body to test generating index in Elasticsearch
	curl -d '{"key": "value"}' -X POST localhost:7070/post
