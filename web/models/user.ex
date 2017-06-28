defmodule CoverMyPingPong.User do
  use CoverMyPingPong.Web, :model

  alias CoverMyPingPong.Repo

  schema "users" do
    field :name, :string
    field :matches_won, :integer
    field :matches_played, :integer

    has_many :games_winner, CoverMyPingPong.Game, foreign_key: :match_winner_id
    has_many :games_player, CoverMyPingPong.Game, foreign_key: :player_id
    has_many :games_opponent, CoverMyPingPong.Game, foreign_key: :opponent_id

    timestamps()
  end

  @all_params [:name, :matches_won, :matches_played]
  @required_params [:name]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @all_params)
    |> validate_required(@required_params)
    |> unique_constraint(:name)
  end
end
