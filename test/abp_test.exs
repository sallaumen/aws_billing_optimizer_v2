defmodule ABPTest do
  use ExUnit.Case
  doctest ABP

  test "greets the world" do
    assert ABP.hello() == :world
  end
end
