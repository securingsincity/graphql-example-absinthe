defmodule GraphqlExampleAbsinthe.Family do
  use GraphqlExampleAbsinthe.Web, :model

  schema "families" do
    belongs_to :employer, GraphqlExampleAbsinthe.Employer
    belongs_to :primary_user, GraphqlExampleAbsinthe.User
    has_many :dependents, GraphqlExampleAbsinthe.User
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:employer_id, :primary_user_id])
  end

end