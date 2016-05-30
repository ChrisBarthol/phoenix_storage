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

users = [
    {
        "username":     "user01@test.com",
        "first_name":   "Robot",
        "last_name":    "1",
        "password":     "1234",
        "phone_number": "",
        "role":         "admin"
    },
    {
        "username":     "user02@test.com",
        "first_name":   "Robot",
        "last_name":    "2",
        "password":     "5678",
        "phone_number": "",
        "role":         "batman"
    },
    {
        "username":     "user03@test.com",
        "first_name":   "Robot",
        "last_name":    "3",
        "phone_number": "",
        "role":         "user"
    }
]

add_objects(users, User)

locations = [
    {
        "name": "He-Man's Shack",
        "address": "2138 Triad Court",
        "city": "Columbus",
        "zip_code": 43235,
        "state": "OH"
    }
]

add_objects(locations, Location)

u = db.session.query(User).first()
u.locations.append(db.session.query(Location).first())
db.session.add(u)
db.session.commit()

substances = [
    {
        "name": "Milk",
        "density": 1.035,
        "caloric_censity": 6.2
    }
]

add_objects(substances, Substance)

containers = [
    {
        "name": "Milk",
        "place": "kitchen",
        "full_amount": 100,
        "warning_amount": 30,
        "location_id": db.session.query(Location).first().id,
        "substance_id": db.session.query(Substance).first().id
    }

]

add_objects(containers, Container)

u = db.session.query(User).first()
u.containers.append(db.session.query(Container).first())
db.session.add(u)
db.session.commit()

defmodule Seeds do
  #start import
  def import_data(users,locations, substances, containers) do
    import_users users
  end

  defp import_users([{user}|t]) do
    Storage.Repo.insert!(User{user}, log: false)
  end
end
