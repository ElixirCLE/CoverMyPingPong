defmodule CoverMyPingPong.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :matches_won, :integer
      add :matches_played, :integer

      timestamps()
    end

  end
end
