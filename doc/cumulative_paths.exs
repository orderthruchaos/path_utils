d = Path.split System.cwd
f = fn
  x, []          -> [x]
  x, [h|_] = acc -> [ Path.join(h, x) | acc ]
end
all = List.foldl(d, [], f) |> Enum.reverse

is_sl = fn (p) ->
  case :file.read_link(p) do
    {:ok, _} -> true
    _        -> false
  end
end
Enum.any? all, is_sl
