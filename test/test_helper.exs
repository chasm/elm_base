ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ElmBase.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ElmBase.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ElmBase.Repo)

