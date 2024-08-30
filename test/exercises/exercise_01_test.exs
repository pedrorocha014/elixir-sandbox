defmodule Exercise01Test do
  use ExUnit.Case

  doctest Exercise_01

  test "should count words correctly" do
    result = 
        "casa CaSa porta" 
        |> Exercise_01.count_words

    assert result == %{"casa" => 2, "porta" => 1} 
  end
end
