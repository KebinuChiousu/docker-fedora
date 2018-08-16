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
network-create:
	docker network create --driver bridge --subnet "240.20.0.0/24" --gateway "240.20.0.1" docker-lan
network-destroy:
	docker network rm docker-lan
