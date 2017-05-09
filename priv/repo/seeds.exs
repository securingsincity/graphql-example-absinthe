# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GraphqlExampleAbsinthe.Repo.insert!(%GraphqlExampleAbsinthe.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GraphqlExampleAbsinthe.{ Employer, User, Family, Repo }
maxwell = Repo.insert!(%Employer{
  name: "Maxwell Health"
})

google = Repo.insert!(%Employer{
  name: "Google"
})

doos = Repo.insert!(%Family{
  employer_id: maxwell.id
})

seinfelds = Repo.insert!(%Family{
  employer_id: maxwell.id
})

shaggy = Repo.insert!(%User{
  first_name: "Shaggy",
  last_name: "Doo",
  type: "employee",
  family_id: doos.id,
  employer_id: maxwell.id
})

scoobydoo = Repo.insert!(%User{
  first_name: "Scooby",
  last_name: "Doo",
  type: "spouse",
  family_id: doos.id,
  employer_id: maxwell.id
})

scrappydoo = Repo.insert!(%User{
  first_name: "Scrappy",
  last_name: "Doo",
  type: "child",
  family_id: doos.id,
  employer_id: maxwell.id
})

jerry = Repo.insert!(%User{
  first_name: "Jerry",
  last_name: "Seinfeld",
  type: "employee",
  family_id: seinfelds.id,
  employer_id: maxwell.id
})

schmoopy = Repo.insert!(%User{
  first_name: "Schmoopy",
  last_name: "Seinfeld",
  type: "spouse",
  family_id: seinfelds.id,
  employer_id: maxwell.id
})

Repo.update!(Family.changeset(doos, %{primary_user_id: shaggy.id}))
Repo.update!(Family.changeset(seinfelds, %{primary_user_id: jerry.id}))