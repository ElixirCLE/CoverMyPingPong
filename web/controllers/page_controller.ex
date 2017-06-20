defmodule CoverMyPingPong.PageController do
  use CoverMyPingPong.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
