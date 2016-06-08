# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Storage.Repo.insert!(%Storage.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Storage.Repo
alias Storage.Container
alias Storage.User


def populate_users(n) do
  Repo.insert!(%User{
      username: "user#{n}test.com",
      first_name: "Robot",
      last_name: "#{n}",
      password: "testtesttest#{n}",
      phone_number: "",
      role: "user"
  })
  populate_users(n-1)
end

def populate_locations(n) do
  Repo.insert!(%Location{
      name: "Shack #{n}",
      address: "123 #{n}",
      zip_code: 43035,
      state: "OH"
  })
  populate_locations(n-1)
end

def populate_substances(n) do
  Repo.insert!(%Substance{
      name: "Super Ingredient #{n}",
      density: 1,
      caloric_censity: 3
  })
end

def populate_containers(n) do
  Repo.insert!(%Container{
      name: "Container #{n}",
      place: "kitchen",
      full_amount: 100,
      warning_amount: 30
  })
end
populate_users(10)
populate_locations(4)
populate_substances(10)
popuate_containers(5)

#Need to add relationships
