# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ApiServer.Repo.insert!(%ApiServer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ApiServer.Accounts.User

admin = %User{
  name: "admin",
  password_hash: Pbkdf2.hash_pwd_salt("admin123"),
  real_name: "threemonoliths"",
  mobile: "15555555555",
  position: "itgo",
  is_admin: true,
  perms_number: 15
}

admin
|> ApiServer.Repo.insert