defmodule Works.DynamoDb.Repo do
  def migration_required?(schema) do
    schema.table_name
  end

  def migrate!(schema) do
    # TODO: add_columnやchange_columnどうするか
    create!(schema)
  end

  defp create!(schema) do
    ExAws.Dynamo.create_table(
      schema.table_name,
      schema.key_schema,
      schema.key_definitions,
      schema.read_capacity,
      schema.write_capacity,
      schema.billing_mode
    )
    |> ExAws.request!()
  end
end
