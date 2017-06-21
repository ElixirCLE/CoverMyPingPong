defmodule CoverMyPingPong.Game do
  use CoverMyPingPong.Web, :model

  schema "games" do
    field :player, :string
    field :opponent, :string
    field :player_score, :integer
    field :opponent_score, :integer
    field :played_at, :utc_datetime

    belongs_to :user, CoverMyPingPong.User, foreign_key: :match_winner_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:player, :opponent, :player_score, :opponent_score, :match_winner_id, :played_at])
    |> validate_required([:player, :opponent, :player_score, :opponent_score, :match_winner_id])
  end
end
