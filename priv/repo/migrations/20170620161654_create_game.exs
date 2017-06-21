defmodule CoverMyPingPong.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :player, :string
      add :opponent, :string
      add :player_score, :integer
      add :opponent_score, :integer
      add :match_winner, :string

      timestamps()
    end

  end
end
