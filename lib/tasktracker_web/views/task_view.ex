defmodule TasktrackerWeb.TaskView do
  use TasktrackerWeb, :view
  alias TasktrackerWeb.UserView
  alias TasktrackerWeb.TaskView

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do

    %{
      id: task.id,
      name: task.name,
      desc: task.desc,
      status: task.status,
      time: task.time,
      user: render_one(task.user, UserView, "user.json"),
    }
  end
end
