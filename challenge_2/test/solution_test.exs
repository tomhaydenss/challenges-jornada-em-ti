defmodule SolutionTest do
  use ExUnit.Case

  describe "encrypt/1" do
    test "success cases" do
      success_inputs = [
        %{sample_input: "if man was meant to stay on the ground god would have given us roots", expected_result: "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau"},
        %{sample_input: "have a nice day", expected_result: "hae and via ecy"},
        %{sample_input: "feed the dog", expected_result: "fto ehg ee dd"},
        %{sample_input: "chill out", expected_result: "clu hlt io"}
      ]

      success_inputs
      |> Enum.each(fn %{sample_input: sample_input, expected_result: expected_result} ->
        assert Solution.encrypt(sample_input) == expected_result
      end)
    end

    test "invalid sample" do
      result = Solution.encrypt([:foo, :bar])

      assert result == {:error, :invalid_parameters}
    end
  end
end
