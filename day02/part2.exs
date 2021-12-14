{:ok, body} = File.read("day02/input")
# {:ok, body} = File.read("day02/p1test")

lines = String.split(body, ~r/(\r)?\n/, trim: true)

mapped = lines
|> Enum.map(fn(str) ->
  [dir, pos] = String.split(str, ~r/\s/, trim: true)
  [dir, String.to_integer(pos)]
end)

mapped
|> Enum.map(fn(v) ->
  case v do
    ["forward", x] -> [x,0,0]
    ["down", y] -> [0,y,0]
    ["up", z] -> [0,-z,0]
  end
end)
|> Enum.reduce([0, 0, 0], fn [h, a, 0], [x, y, z] -> [h+x, a+y, ((h)*(a+y))+z] end)
|> Enum.take_every(2)
|> Enum.reduce(1, fn x, acc -> x * acc end)
|> IO.puts
