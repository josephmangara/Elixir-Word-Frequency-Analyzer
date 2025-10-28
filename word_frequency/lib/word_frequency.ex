defmodule WordFrequency do
  def analyze(file_path) do
    file_path
    |> File.read!()
    |> clean_text()
    |> split_words()
    |> count_words()
    |> sort_by_frequency()
  end

  defp clean_text(text) do
    text
    |> String.downcase()
    |> String.replace(~r/[^a-z\s]/, "")
  end

  defp split_words(text), do: String.split(text)

  defp count_words(words) do
    Enum.reduce(words, %{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end

  defp sort_by_frequency(word_map) do
    word_map
    |> Enum.sort_by(fn {_word, count} -> -count end)
  end
end
