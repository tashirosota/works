rdb-down:
	docker stop postgresdb
ddb-down:
	docker stop dynamodb
earthly-down:
	docker stop earthly-buildkitd
down: rdb-down ddb-down earthly-down
compose:
	docker-compose up
compose-down:
	docker-compose down
c:
	iex -S mix phx.server
s:
	mix phx.server
