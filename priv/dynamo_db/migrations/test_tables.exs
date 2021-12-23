
defmodule Works.DynamoDb.Migrations.TestTables do
  import Works.DynamoDb.Repo
  @schema %Works.DynamoDb.Schema{
    table_name: "Tests",
    key_schema: [id: :hash],
    key_definitions: %{id: :string, email: :string}
  }
  def execute! do
    migration_required?(@schema) && migrate!(@schema)
  end
end
