defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    a = 10
    b = 9.0
    IO.puts("a + b = #{a + b}")
    :io.format("~.20f\n", [0.1])
    IO.puts(Integer.gcd(13971, 637613))
    IO.puts(Float.ceil(9.1))
  end
end
