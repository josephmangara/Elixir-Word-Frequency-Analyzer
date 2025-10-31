defmodule WordFrequencyWebWeb.ErrorJSONTest do
  use WordFrequencyWebWeb.ConnCase, async: true

  test "renders 404" do
    assert WordFrequencyWebWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert WordFrequencyWebWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
