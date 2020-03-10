defmodule ApiServerWeb.RoleController do
  use ApiServerWeb, :controller

  use ApiServer.Roles
  import ApiServerWeb.Permissions, 
    only: [
      get_number_from_perms: 1, 
      need_perms: 1, 
      get_all_permissions: 0, 
      get_max_perms_number: 0, 
      get_perms_from_number: 1
    ]
  alias Guardian.Permissions.Bitwise
  import ApiServerWeb.AuthAdminPlug

  plug :auth_admin
  
  action_fallback ApiServerWeb.FallbackController

  def index(conn, params) do
    page = page(params)
    render(conn, "index.json", page: page)
  end

  def create(conn, %{"role" => role_params}) do
    with {:ok, %Role{} = role} <- save_create(Role.changeset(%Role{}, role_params|>convert_perms_to_number)) do
      conn
      |> render("show.json", role: role)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, role} <- get_by_id(Role, id) do
      role = role |> Map.update(:perms_number,%{default: []}, fn(v)-> get_perms_from_number(%{default: v}) end)
      render(conn, "show.json", role: role)
    end
  end

  def update(conn, %{"id" => id, "role" => role_params}) do
    with {:ok, role} <- get_by_id(Role, id) do
      with {:ok, %Role{} = role} <- save_update(Role.changeset(role, role_params|>convert_perms_to_number)) do
        render(conn, "show.json", role: role)
      end
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Role{} = role} <- delete_by_id(Role, id) do
      render(conn, "show.json", role: role)
    end
  end

  # 获取的“所有权限”
  def list_all_perms(conn, _) do
    json conn, get_all_permissions
  end

  defp convert_perms_to_number(params) do
    %{default: perms_number} = %{ default: params
    |> Map.get("perms", []) }
    |> get_number_from_perms

    params = params
    |> Map.update("perms_number", perms_number, fn(v) -> perms_number end)

    params
  end
end
