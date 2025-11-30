all: up

ps:
	cd srcs && docker compose ps
up:
	cd srcs && docker compose up -d
