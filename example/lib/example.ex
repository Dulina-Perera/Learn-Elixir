defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    correct = :rand.uniform(10) - 1

    guess = IO.gets("Guess a number between 0 and 9: ") |> String.trim() |> Integer.parse()
    IO.inspect(guess)

    case guess do
      {num, _} when num < correct -> IO.puts("Too low!")
      {num, _} when num > correct -> IO.puts("Too high!")
      {num, _} when num == correct -> IO.puts("Correct!")
      :error -> IO.puts("Invalid input")
    end
  end
end
