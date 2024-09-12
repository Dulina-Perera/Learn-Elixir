defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    memberships = {:bronze, :silver, :gold}
    memberships = Tuple.append(memberships, :platinum)
    IO.inspect(memberships)

    prices = {10, 20, 30, 40}
    avg = Tuple.sum(prices) / tuple_size(prices)
    IO.inspect(avg)

    IO.puts(
      "Average price for #{elem(memberships, 0)} #{elem(memberships, 1)} #{elem(memberships, 2)} #{elem(memberships, 3)} is #{avg}."
    )

    users = [
      {"John", 30, :silver},
      {"Jane", 25, :bronze},
      {"Doe", 35, :gold}
    ]
    Enum.each(users, fn {name, age, membership} -> {
      IO.puts("#{name} is #{age} years old and has a #{membership} membership.")
    } end)
  end
end
