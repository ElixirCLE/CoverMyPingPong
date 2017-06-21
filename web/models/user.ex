defmodule CoverMyPingPong.User do
  use CoverMyPingPong.Web, :model

  schema "users" do
    field :name, :string
    field :matches_won, :integer
    field :matches_played, :integer

    has_many :games, CoverMyPingPong.Game, foreign_key: :match_winner_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :matches_won, :matches_played])
    |> validate_required([:name])
  end
end
