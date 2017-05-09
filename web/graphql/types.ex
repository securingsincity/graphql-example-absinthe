defmodule GraphqlExampleAbsinthe.Graphql.Types do
  use Absinthe.Schema.Notation
  alias GraphqlExampleAbsinthe.{
    Employer, User, Family
  }

  object :employer do
    field :id, :id
    field :name, :string
    field :some_useless_field, :string
    field :employees, list_of(:user) do
      resolve fn parent, _, _ ->
        batch({GraphqlExampleAbsinthe.Graphql.Helpers, :has_many_employees, User}, parent.id, fn batch_results ->
          {:ok, Map.get(batch_results, parent.id, [])}
        end)
      end
    end
    field :families, list_of(:family)
  end

  object :user do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :type, :string
    field :employer, :employer
    field :family, :family do
      resolve fn parent, _,_ ->
        batch({GraphqlExampleAbsinthe.Graphql.Helpers, :by_id, Family}, parent.family_id, fn batch_results ->
          {:ok, Map.get(batch_results, parent.family_id)}
        end)
      end
    end
  end

  object :family do
    field :id, :id
    field :employer, :employer
    field :primary_user, :user
    field :dependents, list_of(:user) do
      resolve fn parent, _, _ ->
        batch({GraphqlExampleAbsinthe.Graphql.Helpers, :has_many_dependents, User}, parent.id, fn batch_results ->
          {:ok, Map.get(batch_results, parent.id, [])}
        end)
      end
    end
  end

end