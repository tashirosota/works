defmodule WorksWeb.PageController do
  use WorksWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
