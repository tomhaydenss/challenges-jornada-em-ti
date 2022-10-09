defmodule Solution do
  def encrypt(s) when is_binary(s) do
    s
    |> remove_spaces()
    |> get_chars()
    |> with_columns_limit()
    |> words_for_each_column()
    |> format_output()
  end

  def encrypt(_), do: {:error, :invalid_parameters}

  defp remove_spaces(s) do
    s
    |> String.split()
    |> Enum.join()
  end

  defp get_chars(s), do: String.graphemes(s)

  defp with_columns_limit(chars), do: {chars, columns_limit(chars)}

  defp columns_limit(chars) do
    chars
    |> length()
    |> :math.sqrt()
    |> :math.ceil()
    |> trunc()
  end

  defp words_for_each_column({chars, columns_limit}) do
    chars
    |> Enum.with_index()
    |> Enum.reduce(new_words(columns_limit), fn {char, index}, new_words ->
      offset = rem(index, columns_limit)
      List.update_at(new_words, offset, fn word -> word <> char end)
    end)
  end

  defp new_words(columns_limit), do: List.duplicate("", columns_limit)

  defp format_output(words), do: Enum.join(words, " ")
end
