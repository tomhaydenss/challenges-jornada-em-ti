defmodule SolutionTest do
  use ExUnit.Case

  test "joão e maria sample" do
    m = [7, 6, 9, 8]
    j = [10, 6, 7, 8]

    result = Solution.compare_grades(m, j)

    assert result == [1, 1]
  end

  test "challenge sample" do
    m = [6, 8, 7, 9]
    j = [9, 6, 7, 10]

    result = Solution.compare_grades(m, j)

    assert result == [1, 2]
  end

  test "invalid sample" do
    result = Solution.compare_grades(:foo, :bar)

    assert result == {:error, :invalid_parameters}
  end
end
