defmodule GraphqlExampleAbsinthe.User do
  use GraphqlExampleAbsinthe.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :type, :string
    belongs_to :employer, GraphqlExampleAbsinthe.Employer
    belongs_to :family, GraphqlExampleAbsinthe.Family
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :type, :employer_id, :family_id])
  end

end