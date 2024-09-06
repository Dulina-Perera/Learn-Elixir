defmodule Example do
  use Application

  @x 5 # Bind x to 5. x is a compile-time attribute.

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    x = 9 # Bind x to 9. x is a runtime variable.
    x = 6 # Rebind x to 6. x is a runtime variable.
    IO.puts(x + @x) # 6 + 5 = 11
  end
end
