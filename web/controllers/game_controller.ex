defmodule CoverMyPingPong.GameController do
  use CoverMyPingPong.Web, :controller

  alias CoverMyPingPong.{Game, User}

  def index(conn, params) do
    page = Game
           |> Game.distinct_dates
           |> Repo.all
           |> Repo.paginate(params)

    matches = Game
              |> where(played_at_date: ^(page.entries |> List.first))
              |> Repo.all
              |> Repo.preload(:user_player)
              |> Repo.preload(:user_opponent)
              |> Repo.preload(:user_winner)

    render conn, "index.html", matches: matches,
      page_number: page.page_number, total_pages: page.total_pages
  end

  def new(conn, _params) do
    query = from(u in User, select: {u.name, u.id})
    users = Repo.all(User)

    changeset = Game.changeset(%Game{})
    render conn, "new.html", changeset: changeset, users: users
  end

  def create(conn, %{"game" => game_params}) do
    changeset = Game.changeset(%Game{}, game_params)

    case Repo.insert(changeset) do
      {:ok, game} ->
        match_winner = Repo.get!(User, game.match_winner_id)
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
