# Dado uma frase, deve retornar quantas vezes cada palavra foi usada.

defmodule Exercise01 do
    def count_words(phrase)  do
        phrase
        |> String.downcase
        |> String.split
        |> Enum.reduce(%{}, fn(word, map) -> 
            Map.update(map, word, 1, &(&1 + 1)) 
        end)
    end
end