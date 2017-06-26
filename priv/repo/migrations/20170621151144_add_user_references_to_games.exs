defmodule CoverMyPingPong.Repo.Migrations.AddUserReferencesToGames do
  use Ecto.Migration

  def change do
    alter table(:games) do
      add :player_id, references(:users, on_delete: :nothing)
      add :opponent_id, references(:users, on_delete: :nothing)
    end
  end
end
