defmodule Trash.Factory do
  alias Trash.User
  alias Postgres.Repo

  def run(last) when last >= 2000000, do: nil
  def run(last \\ 0) do
    IO.puts last
    last..last + 99
    |> Enum.reduce([], fn x, acc ->
      [create_user(x)] ++ acc
    end)
    |> (&Repo.insert_all(User, &1)).()
    run(last + 100)
  end

  def create_user(user_number) do
    now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
    [
      username: "username#{user_number}",
      password: :crypto.strong_rand_bytes(100) |> Base.url_encode64 |> binary_part(0, 100),
      email: "email#{user_number}@gmail.com",
      role: :rand.uniform(3) |> Integer.to_string(),
      token: :crypto.strong_rand_bytes(100) |> Base.url_encode64 |> binary_part(0, 100),
      phone_number: "999444333",
      avatar_url: "https://somerandomurl.com/avatar#{user_number}",
      name: "Name Secondname#{user_number}",
      inserted_at: now,
      updated_at: now
    ]
    |> Kernel.++(
      1..10
      |> Enum.map(fn x ->
          ["string#{x}": :crypto.strong_rand_bytes(20) |> Base.url_encode64() |> binary_part(0, 20)]
      end)
      |> List.flatten()
    )
    |> Kernel.++(
      1..10
      |> Enum.map(fn x ->
          ["integer#{x}": :rand.uniform |> Kernel.*(1000000) |> trunc()]
      end)
      |> List.flatten()
    )
  end
end
