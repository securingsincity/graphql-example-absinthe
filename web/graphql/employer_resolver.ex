defmodule GraphqlExampleAbsinthe.EmployerResolver do
  alias GraphqlExampleAbsinthe.{Employer, Repo}
  import Ecto.Query

  def all(_args, _) do
    {:ok, Repo.all(Employer)|> Repo.preload([:families]) }
  end

  def create(%{employer_input: employer_input}, _) do
    changeset = %Employer{}
      |> Employer.changeset(employer_input)
      |> GraphqlExampleAbsinthe.Repo.insert
  end
end