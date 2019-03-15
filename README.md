# Tasktracker 2 with Managers and TimeBlocks
Home Page will feature a Register button
User Session is shown on the right side of the navigation
-If logged in, users will see their email and a 'Logout' option
-If logged out, users will see an input box for logging in

Tasks Page
-User cannot enter a Time that is not an increment of 15
-Task can be unassigned - assigned to nil - not assigned to anyone yet - these tasks will not show up in Task Reports
-You can only assign tasks to yourself or your underlings (employees)
-Task Report will display all of a user's employees' tasks (will not show up if the user does not have employees)

Users Page
-Lists Users, showing their Email and Name (Only lists users with relation to current user
-Has a 'Show' button for each user that brings up that user's details along with its manager/employees if any
-Option to add another user (for a friend, colleague, or assignee)
-Users can only edit/delete themselves or their underlings (employees)

# To Start Server:

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
