# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tasktracker.Repo.insert!(%Tasktracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Tasktracker.Repo
alias Tasktracker.Users.User
alias Tasktracker.Tasks.Task

Repo.insert!(%User{email: "tu.r@husky.neu.edu", name: "Richard"})
Repo.insert!(%User{email: "bob@gmail.com", name: "Bob"})

Repo.insert!(%Task{desc: "Networks", name: "Study"})
