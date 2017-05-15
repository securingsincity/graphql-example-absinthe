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

  mutation do
    @desc "Create an employer"
    field :employer, :employer do
      arg :employer_input, :employer_input
      resolve &GraphqlExampleAbsinthe.EmployerResolver.create/2
    end
    @desc "Create an family"
    field :family, :family do
      arg :employer_id, non_null(:integer)
      arg :family, non_null(:family_input)
      resolve &GraphqlExampleAbsinthe.FamilyResolver.create/2
    end
  end
end