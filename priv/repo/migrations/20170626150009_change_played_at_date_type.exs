defmodule CoverMyPingPong.Repo.Migrations.ChangePlayedAtDateType do
  use Ecto.Migration

  def change do
    alter table(:games) do
      modify :played_at_date, :date
    end
  end
end
