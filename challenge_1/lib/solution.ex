defmodule Solution do
  def compare_grades(first_grades, second_grades)
      when is_list(first_grades) and is_list(second_grades) do
    summary =
      Enum.zip(first_grades, second_grades)
      |> Enum.reduce(%{first: 0, second: 0}, &compare_and_count/2)

    [summary.first, summary.second]
  end

  def compare_grades(_, _), do: {:error, :invalid_parameters}

  defp compare_and_count({first_grade, second_grade}, result) when first_grade > second_grade, do: %{result | first: result.first + 1}
  defp compare_and_count({first_grade, second_grade}, result) when second_grade > first_grade, do: %{result | second: result.second + 1}
  defp compare_and_count(_, result), do: result
end
