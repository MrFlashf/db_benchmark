defmodule UnusedSchemaTest do
  use ExUnit.Case
  doctest UnusedSchema

  test "greets the world" do
    assert UnusedSchema.hello() == :world
  end
end
