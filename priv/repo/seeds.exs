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
alias Tasktracker.Tasks.Manage

Repo.insert!(%User{email: "tu.r@husky.neu.edu", name: "Richard"})
Repo.insert!(%User{email: "bob@gmail.com", name: "Bob"})
Repo.insert!(%User{email: "joe@gmail.com", name: "Joe"})

Repo.insert!(%Task{desc: "Networks", name: "Study", status: "Incomplete", time: 60})
Repo.insert!(%Task{desc: "Web Dev", name: "Homework", status: "Incomplete", time: 120})
Repo.insert!(%Manage{manager_id: 1, employee_id: 2})
Repo.insert!(%Manage{manager_id: 1, employee_id: 3})
