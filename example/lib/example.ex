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

    user = {"Dulina", 23, :gold}
    {name, age, membership} = user
    IO.puts("#{name} is #{age} years old and has a #{membership} membership.")
  end
end
