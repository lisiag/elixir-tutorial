defmodule M do
  def hello do
    name = IO.gets("What is your name? ") |> String.trim
    IO.puts "Hello #{name}"
  end

  def execute_data_stuff do
    data_stuff()
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
  end

end
