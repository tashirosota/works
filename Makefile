rdb:
	earthly -P +rdb
rdb-logs:
	docker logs -f postgresdb
ddb:
	earthly -P +ddb
db: rdb ddb rdb-logs
rdb-down:
	docker stop postgresdb
ddb-down:
	docker stop dynamodb
down: rdb-down ddb-down
c:
	iex -S mix phx.server
s:
	mix phx.server
