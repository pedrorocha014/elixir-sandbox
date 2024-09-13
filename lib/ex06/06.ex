defmodule Solution do
    def solve(list1, list2) do
        list1_number = get_number(list1, 0, 1)
        list2_number = get_number(list2, 0, 1)

        list1_number + list2_number
        |> Integer.to_string
        |> String.reverse
        |> String.graphemes
        |> Enum.map(fn x -> 
            x |> String.to_integer 
        end)        
    end

    def get_number([], acc, _), do: acc

    def get_number([num | rest], acc, mult) do
        get_number(rest, acc + (mult * num), mult * 10)
    end
end