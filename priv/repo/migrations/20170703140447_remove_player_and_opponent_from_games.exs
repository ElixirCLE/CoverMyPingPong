defmodule CoverMyPingPong.Repo.Migrations.RemovePlayerAndOpponentFromGames do
  use Ecto.Migration

  def change do
    alter table(:games) do
      remove :player
      remove :opponent
    end
  end
end
