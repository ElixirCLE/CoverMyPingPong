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

  @all_params [:player, :opponent, :player_score, :opponent_score, :player_id, :opponent_id, :played_at_date, :location]
  @required_params [:player_id, :opponent_id, :player_score, :opponent_score, :played_at_date, :location]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @all_params)
    |> validate_required(@required_params)
    |> put_winner
  end

  @doc """
  Create a query that returns Games in reverse order.
  """
  def ordered_reverse(query) do
    from g in query,
      order_by: [desc: g.played_at_date],
      preload: [:user_player, :user_opponent, :user_winner]
  end

  defp put_winner(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{player_id: p_id, player_score: p_score, opponent_id: o_id, opponent_score: o_score}} ->
        winner = [%{id: p_id, score: p_score}, %{id: o_id, score: o_score}]
        |> Enum.sort(&(&1.score > &2.score))
        |> List.first

        put_change(changeset, :match_winner_id, winner.id)
      _ ->
        changeset
    end
  end
end
