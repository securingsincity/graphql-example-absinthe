defmodule GraphqlExampleAbsinthe.Graphql.Helpers do
  alias GraphqlExampleAbsinthe.Repo

  def has_many_employees(model, ids) do
    import Ecto.Query
    model
    |> where([m], m.employer_id in ^ids)
    |> where([m], [type: "employee"])
    |> Repo.all
    |> Enum.group_by(fn storage -> Map.get(storage, :employer_id) end)
  end

  def has_many_dependents(model, ids) do
    import Ecto.Query
    model
    |> where([m], m.family_id in ^ids)
    |> where([m], m.type in ["spouse", "child"])
    |> Repo.all
    |> Enum.group_by(fn storage -> Map.get(storage, :family_id) end)
  end

  def by_id(model, ids) do
    import Ecto.Query
    model
    |> where([m], m.id in ^ids)
    |> Repo.all
    |> Map.new(&{&1.id, &1})
  end

end