defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    next_year = DateTime.new!(Date.new!(Date.utc_today().year + 1, 1, 1), Time.new!(0, 0, 0, 0), "Etc/UTC")

    secs_till_next_year = DateTime.diff(next_year, DateTime.utc_now(), :second)
    days_till_next_year = div(secs_till_next_year, 86400)
    hours = div(rem(secs_till_next_year, 86400), 3600)
    minutes = div(rem(secs_till_next_year, 3600), 60)
    seconds = rem(secs_till_next_year, 60)

    IO.puts(
      "New year is #{days_till_next_year} days and #{hours} hours and #{minutes} minutes and #{seconds} seconds away."
    )
  end
end
