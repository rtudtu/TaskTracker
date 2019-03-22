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

Repo.insert!(%User{email: "tu.r@husky.neu.edu", name: "Richard", password: "P@ssw0rd"})
Repo.insert!(%User{email: "bob@gmail.com", name: "Bob", password: "P@ssw0rd"})
Repo.insert!(%User{email: "joe@gmail.com", name: "Joe", password: "P@ssw0rd"})
Repo.insert!(%User{email: "john@gmail.com", name: "John", password: "P@ssw0rd"})

Repo.insert!(%Task{desc: "Networks", name: "Study", status: "Incomplete", time: 60, user_id: 1})
Repo.insert!(%Task{desc: "Web Dev", name: "Homework", status: "Incomplete", time: 120, user_id: 2})
Repo.insert!(%Task{desc: "Software Dev", name: "Homework", status: "Incomplete", time: 90, user_id: 3})
