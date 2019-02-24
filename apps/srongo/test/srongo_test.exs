defmodule SrongoTest do
  use ExUnit.Case
  doctest Srongo

  test "greets the world" do
    assert Srongo.hello() == :world
  end
end
