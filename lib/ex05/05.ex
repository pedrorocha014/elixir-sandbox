defmodule Exercise05 do
    def calculate(s) do
        roman_to_int(s, 0)
    end
    
    defp roman_to_int(<<"M" <> rest >>, result), do: roman_to_int(rest, result + 1000)
    defp roman_to_int(<<"CM" <> rest >>, result), do: roman_to_int(rest, result + 900)
    defp roman_to_int(<<"D" <> rest >>, result), do: roman_to_int(rest, result + 500)
    defp roman_to_int(<<"CD" <> rest >>, result), do: roman_to_int(rest, result + 400)
    defp roman_to_int(<<"C" <> rest >>, result), do: roman_to_int(rest, result + 100)
    defp roman_to_int(<<"XC" <> rest >>, result), do: roman_to_int(rest, result + 90)
    defp roman_to_int(<<"L" <> rest >>, result), do: roman_to_int(rest, result + 50)
    defp roman_to_int(<<"XL" <> rest >>, result), do: roman_to_int(rest, result + 40)
    defp roman_to_int(<<"X" <> rest >>, result), do: roman_to_int(rest, result + 10)
    defp roman_to_int(<<"IX" <> rest >>, result), do: roman_to_int(rest, result + 9)
    defp roman_to_int(<<"V" <> rest >>, result), do: roman_to_int(rest, result + 5)
    defp roman_to_int(<<"IV" <> rest >>, result), do: roman_to_int(rest, result + 4)
    defp roman_to_int(<<"I" <> rest >>, result), do: roman_to_int(rest, result + 1)
    defp roman_to_int("", result), do: result
end