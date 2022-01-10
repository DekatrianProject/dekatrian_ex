defmodule Dekatrian do
  @moduledoc """
  Documentation for `Dekatrian`.
  """
  defstruct [:year, :month, :day]

  @type t :: %__MODULE__{
          year: Dekatrian.year(),
          month: Dekatrian.month(),
          day: Dekatrian.day()
        }

  @type day :: 1..28
  @type month :: 1..13
  @type year :: -9999..9999

  @doc """
  Converts a gregorian date to dekatrian date.

  ## Examples

      iex> Dekatrian.from_gregorian(~D[2022-01-01])
      %Dekatrian{year: 2022, month: 0, day: "Achronian"}

  """
  def from_gregorian(gregorian_date) do
    leap_year = Date.leap_year?(gregorian_date)
    %{year: year, month: month, day: day} = gregorian_date
    day_of_year = Date.day_of_year(gregorian_date) - if leap_year == true, do: 2, else: 1

    {dekatrian_day, dekatrian_month} =
      case {leap_year, month, day} do
        {true, 1, 2} ->
          {"Sincronian", 0}

        {_, 1, 1} ->
          {"Achronian", 0}

        _ ->
          dekatrian_month = floor(day_of_year / 28)
          dekatrian_day = day_of_year - dekatrian_month * 28
          dekatrian_month = dekatrian_month + 1

          if dekatrian_day == 0,
            do: {28, dekatrian_month - 1},
            else: {dekatrian_day, dekatrian_month}
      end

    %Dekatrian{day: dekatrian_day, month: dekatrian_month, year: year}
  end

  @doc """
  Return current day in Dekatrian Calendar.

  ## Examples

      iex> Dekatrian.today()
  """
  def today do
    Date.utc_today()
    |> from_gregorian()
  end
end
