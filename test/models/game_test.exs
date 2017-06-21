defmodule CoverMyPingPong.GameTest do
  use CoverMyPingPong.ModelCase

  alias CoverMyPingPong.Game

  @valid_attrs %{match_winner: "some content", opponent: "some content", opponent_score: 42, player: "some content", player_score: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Game.changeset(%Game{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Game.changeset(%Game{}, @invalid_attrs)
    refute changeset.valid?
  end
end
