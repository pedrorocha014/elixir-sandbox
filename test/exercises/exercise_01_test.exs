defmodule Exercise01Test do
  use ExUnit.Case

  doctest Exercise01

  test "should count words correctly" do
    result = 
        "casa CaSa porta" 
        |> Exercise01.count_words

    assert result == %{"casa" => 2, "porta" => 1} 
  end
end
