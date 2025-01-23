defmodule TryTest do
  use ExUnit.Case
  doctest Try

  test "greets the world" do
    assert Try.hello() == :world
  end
end
