defmodule WorksWeb.UserRegistrationControllerTest do
  use WorksWeb.ConnCase, async: true

  import Works.AccountsFixtures

  describe "GET /users/register" do
    test "redirects if already logged in", %{conn: conn} do
      conn = conn |> log_in_user(user_fixture()) |> get(Routes.user_registration_path(conn, :new))
      assert redirected_to(conn) == "/"
    end
  end
end
