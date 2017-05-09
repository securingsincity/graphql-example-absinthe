defmodule GraphqlExampleAbsinthe.Employer do
  use GraphqlExampleAbsinthe.Web, :model

  schema "employers" do
    field :name, :string
    field :some_useless_field, :string
    has_many :users, GraphqlExampleAbsinthe.User
    has_many :families, GraphqlExampleAbsinthe.Family
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :some_useless_field])
  end

end