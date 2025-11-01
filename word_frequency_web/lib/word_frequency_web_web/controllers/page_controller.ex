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

    render(conn, :words, result: top_50)
  end
end


