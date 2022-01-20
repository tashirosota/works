defmodule Works.Repo.Migrations.CreateDynamoTables do
  use Ecto.Migration

  def change do
    create table(:dynamo_tables) do
      add :table_name, :string
      add :attribute, :map

      timestamps()
    end
  end
end
