defmodule Benchmark do
  def trash_benchmark do
    1..14000
    |> Enum.reduce(0, fn _, acc ->
      measure(fn -> Postgres.Repo.get(Trash.User, get_id()) end) + acc
    end)
  end

  def auth_benchmark do
    1..14000
    |> Enum.reduce(0, fn _, acc ->
      measure(fn -> Postgres.Repo.get(Auth.User, get_id()) end) + acc
    end)
  end

  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end

  defp get_id(), do: Enum.random(1..2000000)
end
