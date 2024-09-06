defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    IO.puts(:"Hello world!") # This is an atom.
    IO.puts("Hello world" <> "!") # This is a string.

    name = "Dulina"
    status = Enum.random([:gold, :silver, :bronze, :"no status"])

    # if status == :gold do
    #   IO.puts("Welcome to the club, #{name}!")
    # else
    #   IO.puts("Get out bruh!")
    # end
    case status do
      :gold -> IO.puts("Welcome to the club, #{name}!")
      :"no status" -> IO.puts("Get subscribed!")
      _ -> IO.puts("Get out bruh!")
    end
  end
end
