defmodule WorksWeb.Admin.OpenSourceSoftweresController do
  use WorksWeb, :controller
  alias Works.DynamoDb.OpenSourceSoftweres

  def index(conn, _params) do
    render(conn, "index.html", open_source_softweres: OpenSourceSoftweres.all())
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"open_source_softwere" => open_source_softwere_params}) do
    OpenSourceSoftweres.create!(open_source_softwere_params)
    redirect(conn, to: "/admin/open_source_softwares")
  end
end
