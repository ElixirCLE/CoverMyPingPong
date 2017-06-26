defmodule CoverMyPingPong.PageController do
  use CoverMyPingPong.Web, :controller

  alias CoverMyPingPong.Game
  alias CoverMyPingPong.User

  def index(conn, _params) do
    query = from(g in Game, order_by: [desc: g.inserted_at], limit: 4)
    recent_matches = Repo.all(query)

    render conn, "index.html", recent_matches: recent_matches
  end
end
