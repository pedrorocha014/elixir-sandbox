defmodule Exercise06Test do
    use ExUnit.Case
  
    doctest Solution
  
    test "should calculate the number and return an list" do
      result = Solution.solve([1,2,3],[1,2,3])
  
      assert result == [2,4,6]
    end
  end
  