defmodule WordFrequencyWebWeb.PageController do
  use WordFrequencyWebWeb, :controller

  # Home page 
  def home(conn, _params) do
    render(conn, :home)
  end

  # Analyze endpoint 
  def analyze(conn, %{"text" => text}) do
    result = WordFrequency.analyze_text(text)
    top_50 = Enum.take(result, 50)
    top_10_for_chart = Enum.take(result, 10)

    render(conn, :words, 
      result: top_50,
      chart_labels: Jason.encode!(Enum.map(top_10_for_chart, &elem(&1, 0))),
      chart_values: Jason.encode!(Enum.map(top_10_for_chart, &elem(&1, 1))),
      original_text: text
      )
  end

  # CSV download
  def download(conn, %{"format" => "csv", "text" => text}) do
    results = WordFrequency.analyze_text(text)

    csv =
      results
      |> Enum.map(fn {word, count} -> "#{word},#{count}" end)
      |> Enum.join("\n")

    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"word_frequency.csv\"")
    |> send_resp(200, csv)
  end

end


