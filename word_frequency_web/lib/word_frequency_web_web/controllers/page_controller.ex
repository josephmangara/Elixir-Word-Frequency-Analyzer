defmodule WordFrequencyWebWeb.PageController do
  use WordFrequencyWebWeb, :controller

  # Home page 
  def home(conn, _params) do
    render(conn, :home)
  end

  # Analyze endpoint 
  def analyze(conn, %{"text" => text}) do
    result = WordFrequency.analyze_text(text)

    render(conn, :words, result: result)
  end
end


