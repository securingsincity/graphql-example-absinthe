defmodule GraphqlExampleAbsinthe.Schema do
  use Absinthe.Schema
  import_types GraphqlExampleAbsinthe.Graphql.Types

  query do
    @desc "Get a list of employers"
    field :employers, list_of(:employer) do
      resolve &GraphqlExampleAbsinthe.EmployerResolver.all/2
    end

    @desc "Get a user of the site"
    field :employees, type: list_of(:user) do
      resolve &GraphqlExampleAbsinthe.EmployeeResolver.all/2
    end
  end
end