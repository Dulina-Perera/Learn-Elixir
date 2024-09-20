defmodule Example do
  require Integer
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    grades = [45, 55, 65, 75]
    moderated_grades = for grade <- grades, do: grade + 5
    IO.inspect(moderated_grades, charlists: :aslists)

    moderated_grades = moderated_grades ++ [85]
    IO.inspect(moderated_grades, charlists: :aslists)

    moderated_grades = [35 | moderated_grades]
    IO.inspect(moderated_grades, charlists: :aslists)

    even_grades = for grade <- moderated_grades, rem(grade, 2) == 0, do: grade
    IO.inspect(even_grades, charlists: :aslists)

    odd_grades = for grade <- moderated_grades, Integer.is_odd(grade), do: grade
    IO.inspect(odd_grades, charlists: :aslists)
  end
end
