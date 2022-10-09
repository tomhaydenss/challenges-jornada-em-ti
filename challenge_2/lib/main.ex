defmodule Main do
  def start() do
    with {:ok, message} <- read_message() do
      encrypted_message = Solution.encrypt(message)

      IO.puts(encrypted_message)
    else
      {:error, _reason} = error -> error |> inspect() |> IO.puts()
    end
  end

  defp read_message do
    with {:ok, input} <- read_input(),
         {:ok, input} <- validate(input) do
      {:ok, input}
    else
      {:error, _} = error -> error
    end
  end

  defp read_input do
    case IO.read(:stdio, :line) do
      :eof -> {:error, :unable_to_read}
      "\n" -> {:error, :unable_to_read}
      input -> {:ok, String.trim(input)}
    end
  end

  defp validate(input) do
    with :ok <- validate_length(input),
         :ok <- validate_content(input) do
      {:ok, input}
    else
      {:error, _} = error -> error
    end
  end

  @max_length 81
  defp validate_length(input) do
    case String.length(input) do
      length when length < 1 or length > @max_length -> {:error, :invalid_message_length}
      _ -> :ok
    end
  end

  @regex "^[[:lower:][:space:]]+$"
  defp validate_content(input) do
    case String.match?(input, ~r/#{@regex}/u) do
      true -> :ok
      false -> {:error, :invalid_content}
    end
  end
end
