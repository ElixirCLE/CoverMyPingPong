defmodule CoverMyPingPong.Game do
  use CoverMyPingPong.Web, :model

  schema "games" do
    field :player, :string
    field :opponent, :string
    field :player_score, :integer
    field :opponent_score, :integer
    field :played_at_date, :date
    field :location, :string

    belongs_to :user_winner, CoverMyPingPong.User, foreign_key: :match_winner_id
    belongs_to :user_player, CoverMyPingPong.User, foreign_key: :player_id
    belongs_to :user_opponent, CoverMyPingPong.User, foreign_key: :opponent_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:player, :opponent, :player_score, :opponent_score, :match_winner_id, :played_at_date, :player_id, :opponent_id, :location])
    |> validate_required([:player_id, :opponent_id, :player_score, :opponent_score, :match_winner_id, :played_at_date, :location])
  end
end
