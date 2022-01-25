defmodule Works.DynamoDb.Repo do
  require Logger
  import Ecto.Query, only: [from: 2]
  alias Works.{Repo, DynamoTable}
  alias ExAws.Dynamo

  def migrate!(schema) do
    if(migration_required?(schema)) do
      create_table(schema)
    else
      Logger.info("#{schema.table_name} table already exists")
    end
  end

  def create(table_name, params) do
    Dynamo.put_item(
      table_name,
      params
    )
    |> ExAws.request!()
  end

  def all(table_name, mod) do
    Dynamo.scan(table_name)
    |> ExAws.request!()
    |> Dynamo.decode_item(as: mod)
    |> REnum.sort_by(& &1.order)
  end

  def find(table_name, mod, key_map) do
    Dynamo.get_item(
      table_name,
      key_map
    )
    |> ExAws.request!()
    |> Dynamo.decode_item(as: mod)
  end

  defp migration_required?(schema) do
    query = from d in DynamoTable, where: d.table_name == ^schema.table_name
    !Repo.exists?(query)
  end

  defp create_table(schema) do
    insert_dynamy_table(schema)

    Dynamo.create_table(
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
