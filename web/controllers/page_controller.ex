defmodule CoverMyPingPong.PageController do
  use CoverMyPingPong.Web, :controller

  alias CoverMyPingPong.{Game, User}

  def index(conn, _params) do
    query = from(g in Game, order_by: [desc: g.played_at_date], limit: 4)
    recent_matches = Repo.all(query)
                     |> Repo.preload(:user_player)
                     |> Repo.preload(:user_opponent)
                     |> Repo.preload(:user_winner)

    render conn, "index.html", recent_matches: recent_matches
  end

  def rules(conn, _params) do
    render conn, "rules.html"
  end
end
