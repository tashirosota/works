defmodule Works.DynamoDb.Musics do
  alias Works.DynamoDb.Repo
  use MakeEnumerable
  defstruct [:id, :created_at, :description, :url, :title, :order]

  @schema %Works.DynamoDb.Schema{
    table_name: "Musics",
    key_schema: [id: :hash],
    key_definitions: %{id: :number}
  }

  def all do
    Repo.all(@schema.table_name, __MODULE__)
  end

  def create!(musics) do
    next_id = (all() |> REnum.count()) + 1
    now_str = Timex.now() |> to_string()

    params =
      musics
      |> Map.put(:id, next_id)
      |> Map.put(:created_at, now_str)

    Repo.create(@schema.table_name, params)

    find(next_id)
  end

  def find(id) do
    Repo.find(@schema.table_name, __MODULE__, %{id: id})
  end

  def schema do
    @schema
  end
end
