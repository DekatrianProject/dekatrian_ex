defmodule DekatrianTest do
  use ExUnit.Case
  doctest Dekatrian

  test "Convert from gregorian" do
    gregorian_date = %Date{year: 2000, month: 4, day: 28}
    dekatrian_date = %Dekatrian{year: 2000, month: 5, day: 05}

    assert Dekatrian.from_gregorian(gregorian_date) == dekatrian_date
  end

  test "Acrhonian" do
    gregorian_date = %Date{year: 2022, month: 1, day: 1}
    dekatrian_date = %Dekatrian{year: 2022, month: 0, day: "Achronian"}

    assert Dekatrian.from_gregorian(gregorian_date) == dekatrian_date
  end

  test "Sincronian" do
    gregorian_date = %Date{year: 2020, month: 1, day: 2}
    dekatrian_date = %Dekatrian{year: 2020, month: 0, day: "Sincronian"}

    assert Dekatrian.from_gregorian(gregorian_date) == dekatrian_date
  end

  test "Acrhonian in leap year" do
    gregorian_date = %Date{year: 2020, month: 1, day: 1}
    dekatrian_date = %Dekatrian{year: 2020, month: 0, day: "Achronian"}

    assert Dekatrian.from_gregorian(gregorian_date) == dekatrian_date
  end
end
