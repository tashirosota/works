defmodule WorksWeb.Admin.MusicsController do
  use WorksWeb, :controller
  alias Works.DynamoDb.Musics

  def index(conn, _params) do
    render(conn, "index.html", musics: Musics.all())
  end

  def create(conn, %{"music" => music_params}) do
    Musics.create!(music_params)
    redirect(conn, to: "/admin/musics")
  end
end
