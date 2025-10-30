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
    |> String.replace(~r/[^\p{L}\s]/u, "")
  end

  defp split_words(text) do 
    text
    |> String.replace(~r/\s+/, " ")
    |> String.split(" ", trim: true)
  end

  defp count_words(words) do
    Enum.reduce(words, %{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end

  defp sort_by_frequency(word_map) do
    word_map
    |> Enum.sort_by(fn {_word, count} -> -count end)
  end

  def top_n(results, n) do
    Enum.take(results, n)
  end

  def total_unique(results) do
    length(results)
  end

  def save_results(results, output_path) do
    content =
      results
      |> Enum.map(fn {w, c} -> "#{w}: #{c}" end)
      |> Enum.join("\n")

    File.write!(output_path, content)
  end 
end

results = WordFrequency.analyze("sample.txt")
IO.inspect WordFrequency.top_n(results, 5)
IO.puts("Total unique words: #{WordFrequency.total_unique(results)}")
WordFrequency.save_results(results, "output.txt")
