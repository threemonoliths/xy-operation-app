defmodule ApiServerWeb.LoginView do
  use ApiServerWeb, :view
  alias ApiServerWeb.LoginView

  def render("login_ok.json", %{user: user, jwt: token}) do
    %{user: user |> resolve_user, jwt: token, msg: :ok}
  end

  def render("login_error.json", %{msg: msg}) do
    %{msg: msg}
  end

  defp resolve_user(user) do
    %{
      name: user.name,
      real_name: user.real_name,
      position: user.position,
      mobile: user.mobile,
      avatar: user |> ApiServerWeb.UserView.get_avatar,
      perms: user.perms_number |> resolve_perms,
    }
  end

  defp resolve_perms(number) do
    ApiServerWeb.Permissions.get_perms_from_number(%{default: number})
    |> Map.get(:default)
  end

end