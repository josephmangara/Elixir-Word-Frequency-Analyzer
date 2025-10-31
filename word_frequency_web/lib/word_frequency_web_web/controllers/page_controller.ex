defmodule WordFrequencyWebWeb.PageController do
  use WordFrequencyWebWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
