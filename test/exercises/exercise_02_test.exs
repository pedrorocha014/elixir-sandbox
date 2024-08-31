defmodule Exercise02Test do
    use ExUnit.Case
  
    doctest Exercise02
  
    test "should calculate multiplication table" do
      result = 
          5
          |> Exercise02.calculate
  
      assert result == [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
    end
  end
  