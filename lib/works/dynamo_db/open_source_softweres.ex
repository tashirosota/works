defmodule Works.DynamoDb.OpenSourceSoftweres do
  alias Works.DynamoDb.Repo
  use MakeEnumerable
  defstruct [:id, :created_at, :body]

  @schema %Works.DynamoDb.Schema{
    table_name: "OpenSourceSoftwares",
    key_schema: [id: :hash, created_at: :range],
    key_definitions: %{id: :string, created_at: :string}
  }

  def all do
    Repo.all(@schema.table_name, __MODULE__)
  end

  def create!(open_source_softwere_params) do
    current_id = all() |> REnum.count()
    id_str = (current_id + 1) |> to_string()
    now_str = Timex.now() |> to_string()

    params =
      open_source_softwere_params
      |> Map.put(:id, id_str)
      |> Map.put(:created_at, now_str)

    Repo.create(@schema.table_name, params)

    find(id_str, now_str)
  end

  def find(id_str, now_str) do
    Repo.find(@schema.table_name, __MODULE__, %{id: id_str, created_at: now_str})
  end

  def schema do
    @schema
  end
end
