defmodule Solution do
  def compare_grades(first_grades, second_grades)
      when is_list(first_grades) and is_list(second_grades) do
    summary =
      Enum.zip(first_grades, second_grades)
      |> Enum.reduce(%{first: 0, second: 0}, fn grades_to_compare, result ->
        case grades_to_compare do
          {first_grade, second_grade} when first_grade > second_grade ->
            %{result | first: result.first + 1}

          {first_grade, second_grade} when second_grade > first_grade ->
            %{result | second: result.second + 1}

          _ ->
            result
        end
      end)

    [summary.first, summary.second]
  end

  def compare_grades(_, _), do: {:error, :invalid_parameters}
end
