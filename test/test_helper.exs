ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Storage.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Storage.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Storage.Repo)

