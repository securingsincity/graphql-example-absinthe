defmodule GraphqlExampleAbsinthe.Router do
  use GraphqlExampleAbsinthe.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GraphqlExampleAbsinthe do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end
  scope "/", Absinthe do
    forward "/graphiql", Plug.GraphiQL, schema: GraphqlExampleAbsinthe.Schema
    forward "/graphql", Plug, schema: GraphqlExampleAbsinthe.Schema
  end
  # Other scopes may use custom stacks.
  # scope "/api", GraphqlExampleAbsinthe do
  #   pipe_through :api
  # end
end
