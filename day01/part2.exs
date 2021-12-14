{:ok, body} = File.read("day01/input")
# {:ok, body} = File.read("day01/p2test")

lines = String.split(body, ~r/(\r)?\n/, trim: true)

mapped = lines
|> Enum.map(&String.to_integer/1)
|> Enum.chunk_every(3,1,:discard)
|> Enum.flat_map(fn([a,b,c]) -> [a+b+c] end)
|> IO.inspect

mapped
|> Enum.with_index
|> Enum.flat_map(fn({x,i}) ->
  {_, y} = Enum.fetch(mapped, i-1)
  [x-y]
end)
# |> Enum.count
|> Enum.count(fn x -> x >= 1 end)
|> IO.puts
