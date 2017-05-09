defmodule GraphqlExampleAbsinthe.EmployeeResolver do
  alias GraphqlExampleAbsinthe.{User, Repo}
  import Ecto.Query

  def all(_args, _) do
    {:ok, User  |> where([m], [type: "employee"]) |> Repo.all() |> Repo.preload([:family, :employer]) }
  end
end