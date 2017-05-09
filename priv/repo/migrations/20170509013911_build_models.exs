defmodule GraphqlExampleAbsinthe.Repo.Migrations.BuildModels do
  use Ecto.Migration

  def change do
    create table(:employers) do
      add :name, :string
      add :some_useless_field, :string
      timestamps()
    end

    create table(:families) do
      add :employer_id, references(:employers)
      timestamps()
    end

    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :type, :string
      add :family_id, references(:families)
      add :employer_id, references(:employers)
      timestamps()
    end


    alter table(:families) do
      add :primary_user_id, references(:users)
    end
  end
end
