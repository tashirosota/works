defmodule Works.Repo do
  use Ecto.Repo,
    otp_app: :works,
    adapter: Ecto.Adapters.Postgres
end
