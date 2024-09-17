defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    correct = :rand.uniform(10) - 1

    guess = IO.gets("Guess a number between 0 and 9: ") |> String.trim() |> String.to_integer()
    if guess == correct do
      IO.puts("You guessed correctly!")
    else
      IO.puts("You guessed wrong! The correct number was #{correct}")
    end
  end
end
