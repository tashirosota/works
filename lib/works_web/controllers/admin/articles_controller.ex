defmodule WorksWeb.Admin.ArticlesController do
  use WorksWeb, :controller
  alias Works.DynamoDb.Articles

  def index(conn, _params) do
    render(conn, "index.html", articles: Articles.all())
  end

  def create(conn, %{"article" => article_params}) do
    Articles.create!(article_params)
    redirect(conn, to: "/admin/articles")
  end
end
