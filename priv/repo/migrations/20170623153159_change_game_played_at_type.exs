defmodule CoverMyPingPong.Repo.Migrations.ChangeGamePlayedAtType do
  use Ecto.Migration

  def change do
    alter table(:games) do
      modify :played_at, :date
    end
  end
end
