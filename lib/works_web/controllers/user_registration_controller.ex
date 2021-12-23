defmodule WorksWeb.UserRegistrationController do
  use WorksWeb, :controller

  alias Works.Accounts
  alias Works.Accounts.User
  alias WorksWeb.UserAuth

  @spec new(Plug.Conn.t(), any) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"user" => user_params}) do
    {:ok, user} = Accounts.register_user(user_params)
    conn
    |> put_flash(:info, "User created successfully.")
    |> UserAuth.log_in_user(user)
  end
end
