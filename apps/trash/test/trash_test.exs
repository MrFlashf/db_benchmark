defmodule TrashTest do
  use ExUnit.Case
  doctest Trash

  test "greets the world" do
    assert Trash.hello() == :world
  end
end
