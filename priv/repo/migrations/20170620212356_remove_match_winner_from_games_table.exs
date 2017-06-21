defmodule CoverMyPingPong.Repo.Migrations.RemoveMatchWinnerFromGamesTable do
  use Ecto.Migration

  def change do
    alter table(:games) do
      remove :match_winner
    end
  end
end
