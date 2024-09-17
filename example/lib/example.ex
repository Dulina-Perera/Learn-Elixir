defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :age, :membership]
end

defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    gold_membership = %Membership{type: :gold, price: 100}
    silver_membership = %Membership{type: :silver, price: 75}
    bronze_membership = %Membership{type: :bronze, price: 50}
    none_membership = %Membership{type: :none, price: 0}

    users = [
      %User{name: "John", age: 30, membership: silver_membership},
      %User{name: "Jane", age: 25, membership: gold_membership},
      %User{name: "Jim", age: 40, membership: bronze_membership},
      %User{name: "Jill", age: 35, membership: none_membership}
    ]
    Enum.each(users, fn %User{name: name, age: age, membership: membership} -> {
      IO.puts("#{name} is #{age} years old and has a #{membership.type} membership with a price of #{membership.price}.")
    } end)
  end
end
