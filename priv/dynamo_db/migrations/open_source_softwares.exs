
defmodule Works.DynamoDb.Migrations.OpenSourceSoftwares do
  alias Works.DynamoDb.Repo

  def migrate! do
    Repo.migrate!(Works.DynamoDb.OpenSourceSoftweres.schema)
  end
end
