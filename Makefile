db:
	earthly -P +db
c:
	iex -S mix phx.server
s:
	mix phx.server
down:
	docker stop dynamodb && docker rm dynamodb