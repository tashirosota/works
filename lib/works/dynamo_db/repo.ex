defmodule Works.DynamoDb.Repo do
  require Logger
  import Ecto.Query, only: [from: 2]
  alias Works.{Repo, DynamoTable}

  def migrate!(schema) do
    if(migration_required?(schema)) do
      create(schema)
    else
      Logger.info("#{schema.table_name} table already exists")
    end
  end

  # TODO: delete, update
  defp migration_required?(schema) do
    query = from d in DynamoTable, where: d.table_name == ^schema.table_name
    !Repo.exists?(query)
  end

  defp create(schema) do
    insert_dynamy_table(schema)

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

  defp insert_dynamy_table(schema) do
    changeset =
      DynamoTable.changeset(%DynamoTable{}, %{table_name: schema.table_name, attribute: schema})

    {:ok, _} = Repo.insert(changeset)
  end
end
