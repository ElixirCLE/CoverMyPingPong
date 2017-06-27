defmodule CoverMyPingPong.GameController do
  use CoverMyPingPong.Web, :controller

  alias CoverMyPingPong.{Game, User}

  def index(conn, _params) do
    query = from(g in Game, order_by: g.inserted_at)
    recent_matches = Repo.all(query)

    render conn, "index.html", recent_matches: Repo.all(Game)
  end

  def new(conn, _params) do
    query = from(u in User, select: {u.name, u.id})
    users = Repo.all(User)

    changeset = Game.changeset(%Game{})
    render conn, "new.html", changeset: changeset, users: users
  end

  def create(conn, %{"game" => game_params}) do
    changeset = Game.changeset(%Game{}, game_params)

    match_winner = Repo.get!(User, changeset.changes.match_winner_id)

    case Repo.insert(changeset) do
      {:ok, _game} ->
        update_match_winner(match_winner)

        conn
        |> put_flash(:info, "Game successfully added!")
        |> redirect(to: game_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def update_match_winner(winner) do
    matches_won = winner.matches_won + 1
    changeset = User.changeset(winner, %{matches_won: matches_won})
    Repo.update!(changeset)
  end
end
