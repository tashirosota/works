defmodule Works.DynamoDb.Schema do
  defstruct [:table_name, :key_schema, :key_definitions, read_capacity: 1, write_capacity: 1, billing_mode: provisioned]
end
