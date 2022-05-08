defmodule LearnTest do
  use ExUnit.Case
  doctest Learn

  test "greets the world" do
    assert Learn.hello() == :world
  end
end
