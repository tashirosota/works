defmodule Mix.Tasks.Dynamo do
  @migration_file_path "priv/dynamo_db/migrations"
  @module_prefix "Works.DynamoDb.Migrations"
  @requirements ["app.start"]

  use Mix.Task

  def run(_) do
    {:ok, files} = File.ls(@migration_file_path)

    files
    |> compile_migrations()
    |> REnum.each(fn file ->
      module_name =
        file
        |> String.replace(".exs", "")
        |> Macro.camelize()

      module =
        Module.concat(
          @module_prefix,
          module_name
        )

      module.migrate!()
    end)
  end

  defp compile_migrations(files) do
    files
    |> Enum.each(fn file ->
      (@migration_file_path <> "/" <> file)
      |> Code.compile_file()
    end)

    files
  end
end
