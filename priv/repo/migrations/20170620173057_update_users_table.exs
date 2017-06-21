defmodule CoverMyPingPong.Repo.Migrations.UpdateUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :matches_won, :integer, null: false, default: 0
      modify :matches_played, :integer, null: false, default: 0
    end
  end
end
