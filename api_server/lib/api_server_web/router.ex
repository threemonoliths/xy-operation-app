defmodule ApiServerWeb.Router do
  use ApiServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug Guardian.Plug.Pipeline, module: ApiServerWeb.Guardian,
      error_handler: ApiServerWeb.AuthErrorHandler
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/api/v1/public", ApiServerWeb do
    pipe_through :api

    post "/login", LoginController, :login
    # resources "/users", UserController, except: [:new, :edit]
  end

  scope "/api/v1", ApiServerWeb do
    pipe_through [:api, :api_auth]

    resources "/users", UserController, except: [:new, :edit]
    resources "/roles", RoleController, except: [:new, :edit]

  end
end
