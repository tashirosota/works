defmodule Works.DynamoDb.OpenSourceSoftweres do
  require Logger
  alias ExAws.Dynamo
  use MakeEnumerable
  defstruct [:id, :created_at, :body]

  @schema %Works.DynamoDb.Schema{
    table_name: "OpenSourceSoftwares",
    key_schema: [id: :hash, created_at: :range],
    key_definitions: %{id: :string, created_at: :string}
  }

  def all do
    Dynamo.scan(@schema.table_name)
    |> ExAws.request!()
    |> Dynamo.decode_item(as: __MODULE__)
    |> REnum.sort_by(& &1.id)
  end

  def create!(open_source_softwere_params) do
    current_id = all() |> REnum.count()
    id_str = (current_id + 1) |> to_string()
    now_str = Timex.now() |> to_string()

    params =
      open_source_softwere_params
      |> Map.put(:id, id_str)
      |> Map.put(:created_at, now_str)

    Dynamo.put_item(
      @schema.table_name,
      params
    )
    |> ExAws.request!()

    find(id_str, now_str)
  end

  def find(id_str, now_str) do
    Dynamo.get_item(
      @schema.table_name,
      %{id: id_str, created_at: now_str}
    )
    |> ExAws.request!()
    |> Dynamo.decode_item(as: __MODULE__)
  end

  def schema do
    @schema
  end
end
