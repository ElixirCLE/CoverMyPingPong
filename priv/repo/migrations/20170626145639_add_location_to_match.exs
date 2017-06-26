defmodule CoverMyPingPong.Repo.Migrations.AddLocationToMatch do
  use Ecto.Migration

  def change do
    alter table(:games) do
      add :location, :string
      remove :played_at
      add :played_at_date, :utc_datetime
    end
  end
end
