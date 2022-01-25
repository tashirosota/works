
defmodule Works.DynamoDb.Migrations.Articles do
  alias Works.DynamoDb.Repo

  def migrate! do
    Repo.migrate!(Works.DynamoDb.Articles.schema)
  end
end
