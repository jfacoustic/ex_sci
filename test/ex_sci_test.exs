defmodule ExSciTest do
  use ExUnit.Case
  doctest ExSci

  test "greets the world" do
    assert ExSci.hello() == :world
  end
end
