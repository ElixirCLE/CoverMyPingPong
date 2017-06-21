defmodule CoverMyPingPong.PageController do
  use CoverMyPingPong.Web, :controller

  alias CoverMyPingPong.Game

  def index(conn, _params) do
    query = from(g in Game, order_by: g.inserted_at, limit: 5)
    recent_matches = Repo.all(query)

    render conn, "index.html", recent_matches: recent_matches
  end
end
