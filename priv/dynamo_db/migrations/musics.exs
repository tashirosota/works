
defmodule Works.DynamoDb.Migrations.Musics do
  alias Works.DynamoDb.Repo

  def migrate! do
    Repo.migrate!(Works.DynamoDb.Musics.schema)
  end
end
