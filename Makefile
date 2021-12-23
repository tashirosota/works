rdb-down:
	docker stop postgresdb
ddb-down:
	docker stop dynamodb
earthly-down:
	docker stop earthly-buildkitd
down: rdb-down ddb-down earthly-down
db:
	docker-compose up
db-down:
	docker-compose down
c:
	iex -S mix phx.server
s:
	mix phx.server
