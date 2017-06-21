defmodule CoverMyPingPong.GameController do
  use CoverMyPingPong.Web, :controller

  alias CoverMyPingPong.Game
  alias CoverMyPingPong.User

  def index(conn, _params) do
    query = from(g in Game, order_by: g.inserted_at)
    recent_matches = Repo.all(query)

    render conn, "index.html", recent_matches: Repo.all(Game)
  end

  def new(conn, _params) do
    query = from(u in User, select: {u.name, u.id})
    users = Repo.all(query)

    changeset = Game.changeset(%Game{})
    render conn, "new.html", changeset: changeset, users: users
  end

  def create(conn, %{"game" => game_params}) do
    changeset = Game.changeset(%Game{}, game_params)

    case Repo.insert(changeset) do
      {:ok, _game} ->
        conn
        |> put_flash(:info, "Game successfully added!")
        |> redirect(to: game_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
