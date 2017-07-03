defmodule CoverMyPingPong.GameView do
  use CoverMyPingPong.Web, :view

  def prev_button(page_number, total_pages) when page_number <= 1 or total_pages == 0 do
    disabled_button("Prev")
  end
  def prev_button(page_number, _) do
    pagination_button("Prev", page_number - 1)
  end

  def next_button(page_number, total_pages) when page_number >= total_pages or total_pages == 0 do
    disabled_button("Next")
  end
  def next_button(page_number, _) do
    pagination_button("Next", page_number + 1)
  end

  defp pagination_button(text, page) do
    "<a href='?page=" <> Integer.to_string(page) <> "'>" <> text <> "</a>"
  end

  defp disabled_button(text) do
    "<a href='#' disabled tabindex='-1'>" <> text <> "</a>"
  end
end
