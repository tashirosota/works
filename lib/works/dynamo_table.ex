defmodule Works.DynamoTable do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dynamo_tables" do
    field :attribute, :map
    field :table_name, :string

    timestamps()
  end

  @doc false
  def changeset(dynamo_table, attrs) do
    dynamo_table
    |> cast(attrs, [:table_name, :attribute])
    |> validate_required([:table_name, :attribute])
  end
end
