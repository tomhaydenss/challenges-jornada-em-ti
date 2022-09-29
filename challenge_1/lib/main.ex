defmodule Main do
  @default_delimiter " "

  def start() do
    with {:ok, first_grades} <- read_grades(),
         {:ok, second_grades} <- read_grades() do
      [first, second] = Solution.compare_grades(first_grades, second_grades)

      IO.puts("#{first} #{second}")
    else
      {:error, _reason} = error -> inspect(error)
    end
  end

  defp read_grades do
    with {:ok, input} <- read_input(),
         {:ok, grades} <- parse(input) do
      {:ok, grades}
    else
      {:error, _} = error -> error
    end
  end

  defp read_input do
    case IO.read(:stdio, :line) do
      :eof -> {:error, :unable_to_read}
      "\n" -> {:error, :unable_to_read}
      input -> {:ok, input}
    end
  end

  defp parse(input) do
    with trimmed_input <- String.trim(input),
         {:ok, validated_input} <- validate(trimmed_input) do
      parsed_result =
        validated_input
        |> String.split(@default_delimiter)
        |> Enum.map(&String.to_integer/1)

      {:ok, parsed_result}
    else
      {:error, _} = error -> error
    end
  end

  @regex "^[[:digit:]#{@default_delimiter}]+$"
  defp validate(input) do
    case String.match?(input, ~r/#{@regex}/u) do
      true -> {:ok, input}
      false -> {:error, :invalid_input}
    end
  end
end
