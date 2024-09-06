defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    # Escaping characters
    IO.puts("Hello there!\nI am Dulina Perera.\n")
    IO.puts("Interpolation looks like \#{}.")

    # Unicode
    IO.puts(?∆)
    IO.puts("Unicode: \u{1F49A}")
  end
end
