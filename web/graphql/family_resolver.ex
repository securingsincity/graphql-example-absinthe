defmodule GraphqlExampleAbsinthe.FamilyResolver do
  alias GraphqlExampleAbsinthe.{User, Family, Repo}
  import Ecto.Query

  def create(%{employer_id: employer_id, family: family}, _) do
    try do
      inserted_family = Repo.insert!(%Family{
        employer_id: employer_id
      })

      %{primary_user: primary_user, dependents: dependents}  = family
      user = Repo.insert!(%User{
        first_name: primary_user.first_name,
        last_name: primary_user.last_name,
        type: "employee",
        family_id: inserted_family.id,
        employer_id: employer_id
      })

      family = Repo.update!(Family.changeset(inserted_family, %{primary_user_id: user.id}))

      Enum.each(dependents, fn dep ->
        Repo.insert!(%User{
          first_name: dep.first_name,
          last_name: dep.last_name,
          type: dep.type,
          family_id: inserted_family.id,
          employer_id: employer_id
        })
      end)
      {:ok, family}
    rescue
      e -> {:error, "Issue building family" <> e.message}
    end
  end
end