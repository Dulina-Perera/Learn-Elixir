defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    memberships = %{
      gold: :gold,
      silver: :silver,
      bronze: :bronze,
      none: :none
    }

    prices = %{
      gold: 100,
      silver: 50,
      bronze: 25,
      none: 0
    }

    users = [
      {"John", 30, memberships.silver},
      {"Jane", 25, memberships.gold},
      {"Doe", 35, memberships.none}
    ]
    Enum.each(users, fn {name, age, membership} -> {
      IO.puts("#{name} is #{age} years old and has a #{membership} membership with a price of #{prices[membership]}.")
    } end)
  end
end
