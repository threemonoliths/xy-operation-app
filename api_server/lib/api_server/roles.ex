defmodule ApiServer.Roles do
  @moduledoc """
  The Roles context.
  """

  import Ecto.Query, warn: false
  alias ApiServer.Repo

  alias ApiServer.Roles.Role
  use ApiServer.BaseContext

  defmacro __using__(_opts) do
    quote do
      import ApiServer.Roles
      use ApiServer.BaseContext
      alias ApiServer.Roles.Role
    end
  end

  def page(params) do 
    Role
    |> query_like(params, "name")
    |> query_order_by(params, "name")
    |> get_pagination(params)
  end

end
