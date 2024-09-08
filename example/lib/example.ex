defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    date = Date.new!(2024, 09, 08)
    time = Time.new!(18, 58, 32)
    datetime = DateTime.new!(date, time, "Etc/UTC")

    IO.inspect(datetime)
    IO.puts(datetime.year)
  end
end
