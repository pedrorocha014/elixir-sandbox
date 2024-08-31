# Dado um número x, retornar a tabuada até 10.

defmodule Exercise02 do
    def calculate(number) when is_integer(number) do
        calculate(number, [10 * number])
    end

    defp calculate(_number, list) when hd(list) == 0 , do: list

    defp calculate(number, list) do
        calculate(number, [ hd(list) - number | list])
    end
end