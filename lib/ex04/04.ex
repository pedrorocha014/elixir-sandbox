# Dado um array X e um target Y, retornar os indexs cuja soma dos valor é igual ao target

defmodule Exercise04 do
    def get_indexes(array, target) do
        array
        |> Enum.with_index
        |> Enum.reduce_while(%{}, fn {num, index}, acc -> 
            diff = target -  num

            if Map.has_key?(acc, diff) do
              {:halt, [Map.get(acc, diff), index]}
            else
              {:cont, Map.put(acc, num, index)}
            end
        end)
    end
end