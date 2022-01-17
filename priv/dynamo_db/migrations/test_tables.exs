
defmodule Works.DynamoDb.Migrations.TestTables do
  alias Works.DynamoDb.Repo
  @schema %Works.DynamoDb.Schema{
    table_name: "Tests",
    key_schema: [id: :hash],
    key_definitions: %{id: :string}
  }
  def migrate! do
    Repo.migrate!(@schema)
  end
end
