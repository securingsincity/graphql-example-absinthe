defmodule GraphqlExampleAbsinthe.EmployerResolver do
  alias GraphqlExampleAbsinthe.{Employer, Repo}
  import Ecto.Query

  def all(_args, _) do
    {:ok, Repo.all(Employer)|> Repo.preload([:families]) }
  end
end