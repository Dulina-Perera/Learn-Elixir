defmodule Example do
  require Integer
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def get_numbers do
    user_input = IO.gets("Enter a list of integers separated by spaces: ") |> String.trim()
    String.split(user_input, " ") |> Enum.map(&String.to_integer/1) # Capture operator
  end

  def print_list(list) do
    list |> Enum.join(" ") |> IO.puts()
  end

  def sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    average = sum / Enum.count(numbers)
    {sum, average}
  end

  def main do
    numbers = get_numbers()

    IO.puts("\nYou entered: #{inspect(numbers)}")
    {sum, average} = sum_and_average(numbers)
    IO.inspect("Sum: #{sum}, Average: #{average}")
  end
end
