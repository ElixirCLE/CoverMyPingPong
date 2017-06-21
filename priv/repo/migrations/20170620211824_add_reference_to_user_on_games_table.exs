defmodule CoverMyPingPong.Repo.Migrations.AddReferenceToUserOnGamesTable do
  use Ecto.Migration

  def change do
    alter table(:games) do
      add :match_winner_id, references(:users, on_delete: :nothing)
    end
  end
end
