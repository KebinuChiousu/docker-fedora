build:
	docker build -t meredithkm/fedora .
rebuild:
	docker build --no-cache -t meredithkm/fedora .
start:
	docker-compose up -d
stop:
	docker-compose down
destroy:
	sudo rm -rf $(shell docker inspect docker-fedora_home | jq '.[].Mountpoint' -r)
	docker-compose down -v
check:
	docker-compose ps
