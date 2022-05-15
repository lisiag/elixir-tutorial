defmodule M do
  def hello do
    name = IO.gets("What is your name? ") |> String.trim
    IO.puts "Hello #{name}"
  end

  def execute_stuff do
    data_stuff()
    IO.puts ""
    string_stuff()
    IO.puts ""
    math_stuff()
    IO.puts ""
    compare_stuff()
    IO.puts ""
    tuple_stuff()
    IO.puts ""
    list_stuff()
    IO.puts ""
    map_stuff()
    IO.puts ""
    pattern_matching()
    IO.puts ""
    anon_functions()
    IO.puts ""
    recursion()
    IO.puts ""
    enumerables()
    IO.puts ""
    list_comprehensions()
    IO.puts ""
    exception_handling()
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
    IO.puts div(13, 4)
    IO.puts rem(13, 4)
  end

  def compare_stuff do
    IO.puts "Egg == Egg #{"Egg" == "Egg"}"
    IO.puts "Egg === Egg #{"Egg" === "Egg"}"
    IO.puts 4 == 4.0
    IO.puts 4 === 4.0
    IO.puts 4 != 4.0
    IO.puts 4 !== 4.0

    unless 5 < 2 do
      IO.puts "Inside unless block"
    end

    cond do
      5 < 2 -> IO.puts "5 < 2"
      5 > 2 -> IO.puts "5 > 2"
      5 >= 2 -> IO.puts "This is true too"
      true -> IO.puts "default"
    end

    case 3 do
      1 -> IO.puts "one"
      2 -> IO.puts "two"
      _ -> IO.puts "default"
    end

    IO.puts "Ternary:"
    if 7 > 1, do: (IO.puts "7 > 1"), else: (IO.puts "Huh?")
  end

  def tuple_stuff do
    my_tuple = {1, 22, :green, "sunny"}
    IO.puts is_tuple(my_tuple)
    IO.puts elem(my_tuple, 2)
    IO.puts tuple_size(my_tuple)
    my_tuple2 = Tuple.append(my_tuple, 33)
    IO.puts "my_tuple2 *** "
    IO.inspect my_tuple2
    my_el = Tuple.delete_at(my_tuple, 1)
    IO.puts "my_el *** "
    IO.inspect my_el
    IO.puts tuple_size(my_el)
    my_tuple = {2, 33, :yellow, "misty"}
    many_zeros = Tuple.duplicate(0, 50)
    IO.puts tuple_size(many_zeros)
    {_id, _age, _fav_color, fav_weather} = my_tuple # var names prefixed with _ because they are unused
    IO.puts fav_weather
  end

  def list_stuff do
    list1 = [1,2,3]
    Enum.each(list1, &IO.puts/1)
    list2 = [4,5,6]
    list3 = list1 ++ list2
    [head | tail] = list3
    IO.puts head
    IO.puts "Tail *** "
    IO.inspect tail
    list4 = list3 -- list1
    IO.puts "list4 ***"
    IO.inspect list4
    IO.puts "***"
    IO.inspect [97, 98]
    IO.puts "***"
    IO.inspect [97, 98], charlists: :as_lists
    Enum.each tail, fn item ->
      IO.puts item
    end
    IO.puts "Recursion with delete item:"
    IO.puts display_list(List.delete(tail, 3))
    IO.puts "Delete at index:"
    IO.puts display_list(List.delete_at(tail, 0))
    IO.puts "Original list not modified by List.delete()"
    display_list(tail)
    IO.puts List.first(tail)
    IO.puts List.last(tail)
    list_of_tuples = [name: "Lisia", eye_color: "grey"]
    IO.puts list_of_tuples[:name]
  end

  def display_list([head | tail]) do
    IO.puts head
    display_list(tail)
  end

  def display_list([]), do: nil

  def map_stuff do
    IO.puts "Get element from map"
    capitals = %{"Alabama" => "Montgomery",
                 "Alaska" => "Juneau",
                 "Arizona" => "Phoenixxx"}
    IO.puts capitals["Alaska"]
    IO.puts Map.get(capitals, "Alaska")

    capitals2 = %{alabama: "Montgomery",
                 alaska: "Juneau",
                  arizona: "Phoenix"}
    IO.puts capitals2.alaska
    IO.puts "Display each value in map"
    Enum.each(capitals2, fn({_key, val}) -> IO.puts val end)
    IO.puts "Create a new map, modifying one element and adding one new element"
    # can't insert/update into existing map because in Elixir data is always immutable. Must assign to new var or override original var
    capitals3 = capitals |> Map.put("Arkansas", "Little Rock") |> Map.put("Arizona", "Phoenix")
    IO.inspect capitals3
    IO.puts ""
    # a shorter way to achieve the same map as capitals3
    capitals4 = Map.merge(capitals, %{"Arkansas" => "Little Rock", "Arizona" => "Phoenix"})
    IO.inspect capitals4
    IO.puts "Another way to create new map with modifications but not additions is with pipe"
    capitals5 = %{capitals | "Arizona" => "Phoenix"}
    IO.inspect capitals5
    IO.puts ""
    temperatures = %{
      "Monday" => 28,
      "Tuesday" => 29,
      "Wednesday" => 29,
      "Thursday" => 24,
      "Friday" => 16,
      "Saturday" => 16,
      "Sunday" => 20
    }
    convertedMap = Enum.map(temperatures, fn {day, temp} -> {day, temp * 1.8 + 32} end)
    IO.inspect convertedMap
    # Enum.map returns an array. Convert to map
    IO.inspect Enum.into(convertedMap, %{})
    convertedArray = Enum.map(temperatures, fn {_day, temp} -> temp * 1.8 + 32 end)
    IO.inspect convertedArray

    # Using pipe operator instead of creating var at each step
    %{
      Josiah: 1995,
      Tessa: 1997,
      Lisia: 1971,
      Geoff: 1969
    }
    |> Enum.map(fn {name, yob} -> {name, 2022-yob} end)
    |> Enum.into(%{})
    |> IO.inspect
  end

  def pattern_matching do
    [_length, width] = [20, 30]
    IO.puts width
    [_, [_, a]] = [10, [30, 40]]
    IO.puts a
  end

  def anon_functions do
    add_two = fn (x, y) -> x + y end
    IO.puts add_two.(3, 4)
    add_two2 = &(&1 + &2)
    IO.puts add_two2.(3, 4)
    # overloading
    add_sum = fn
      {x, y} -> x + y
      {x, y, z} -> x + y + z
    end
    IO.puts add_sum.({3, 4})
    IO.puts add_sum.({3, 4, 5})
    # default values for parameters

    IO.puts do_it(3, 4)
    IO.puts do_it()
  end

  def do_it(x \\1, y \\2) do
    x + y
  end

  def recursion do
    IO.puts  sum([1,2,3])
    loop(5,1)
  end

  def sum([]), do: 0

  def sum([head|tail]), do: head + sum(tail)

  def loop(0, _), do: nil

  def loop(max, min) do
    if max < min do
      loop(0, min)
    else
      IO.puts "Num : #{max}"
      loop(max - 1, min)
    end
  end

  def enumerables() do
    # Are all of the list elements even?
    IO.puts Enum.all?([1, 2, 3],
      fn(n) -> rem(n, 2) == 0 end)
    IO.puts Enum.all?([2, 4, 6],
      fn(n) -> rem(n, 2) == 0 end)

    IO.puts Enum.any?([1, 2, 3],
      fn(n) -> rem(n, 2) == 0 end)

    Enum.each([1, 2, 3], fn(n) -> IO.puts "List elem: #{n}" end)

    sum_vals = Enum.reduce([1, 2, 3], fn(n, sum) -> n + sum end)
    IO.puts sum_vals
    # same thing but with an accumulator (initial value)
    sum_vals2 = Enum.reduce([1, 2, 3], 33, fn(n, sum) -> n + sum end)
    IO.puts sum_vals2

    IO.inspect Enum.uniq([1, 2, 2, 3])
  end

  def list_comprehensions() do
    dbl_list = for n <- [1, 2, 3], do: n * 2
    IO.inspect dbl_list

    even_list = for n <- [1, 2, 3, 4], rem(n, 2) == 0, do: n
    IO.inspect even_list
  end

  def exception_handling() do
    err = try do 5 / 0
          rescue
            ArithmeticError -> "Can't divide by zero"
          end
    IO.puts err
  end
end
