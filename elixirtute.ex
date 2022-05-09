defmodule M do
  def hello do
    name = IO.gets("What is your name? ") |> String.trim
    IO.puts "Hello #{name}"
  end

  def execute_stuff do
    data_stuff()
    IO.puts ""
    string_stuff()
  end

  def data_stuff do
    my_int = 123
    my_float = 3.14
    my_atom = :Pittsburgh
    my_atom2 = :"Atom with spaces"
    on_to_10 = 1..10 # range data type
    IO.puts "#{my_int} is integer: #{is_integer(my_int)}"
    IO.puts "#{my_float} is float: #{is_float(my_float)}"
    IO.puts "#{my_int} is float: #{is_float(my_int)}"
    IO.puts "#{my_atom} is atom: #{is_atom(my_atom)}"
    IO.puts "#{my_atom2} is atom: #{is_atom(my_atom2)}"
    Enum.map(on_to_10, fn(x) -> IO.puts x end)
  end

  def string_stuff do
    my_str = "my string"
    IO.puts "Length: #{String.length(my_str)}"
    longer_str = my_str <> " " <> "is longer"
    IO.puts longer_str
    IO.puts "Equal Egg egg: #{"Egg" === "egg"}"
    IO.puts "Equal Egg Egg #{"Egg" === "Egg"}"
    IO.puts "Contains ng? #{String.contains?(my_str, "ng")}"
    IO.puts "First: #{String.first(my_str)}"
    IO.puts "Index 4: #{String.at(my_str, 4)}"
    IO.puts "Substring: #{String.slice(my_str, 3, 2)}"
    IO.inspect String.split(longer_str, " ")
    IO.puts String.reverse(longer_str)
    IO.puts String.upcase(my_str)
    # Piping
    4 * 10 |> IO.puts
  end

  def math_stuff do

  end

end
