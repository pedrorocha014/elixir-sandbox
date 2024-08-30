# Dado uma frase, deve retornar quantas vezes cada palavra foi usada.

defmodule Exercise_01 do
    def count_words(phrase)  do
        phrase
        |> String.downcase
        |> String.split
        |> Enum.reduce(%{}, fn(word, map) -> 
            Map.update(map, word, 1, &(&1 + 1)) 
        end)
    end
end

"o rato roeu a roupa do rato do rei de roma"
|> Exercise_01.count_words
|> IO.inspect