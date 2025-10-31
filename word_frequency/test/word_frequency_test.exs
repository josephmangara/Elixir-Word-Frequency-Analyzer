defmodule WordFrequencyTest do
  use ExUnit.Case
  alias WordFrequency

  test "counts words correctly" do
    result = WordFrequency.analyze("test/sample.txt")
    assert {"elixir", 2} in result
    assert {"fun", 1} in result
  end
end
