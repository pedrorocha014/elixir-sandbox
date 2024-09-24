defmodule Username do
    def sanitize([]), do: ~c""

    def sanitize([?ä | rest]), do: ~c"ae" ++ sanitize(rest)
    def sanitize([?ö | rest]), do: ~c"oe" ++ sanitize(rest)
    def sanitize([?ü | rest]), do: ~c"ue" ++ sanitize(rest)
    def sanitize([?ß | rest]), do: ~c"ss" ++ sanitize(rest)
    

    def sanitize([char | rest]) when char >= ?a and char <= ?z, do: [char] ++ sanitize(rest)
    def sanitize([?_ | rest]), do: ~c"_" ++ sanitize(rest)
    def sanitize([_ | rest]), do: sanitize(rest)
end