defmodule CoverMyPingPong.GameTest do
  use CoverMyPingPong.{ModelCase}
  import CoverMyPingPong.Factory

  alias CoverMyPingPong.{Game}

  @valid_attrs %{
    player_id: 1,
    opponent_id: 2,
    player_score: Enum.random(0..21),
    opponent_score: Enum.random(0..21),
    match_winner_id: 1,
    played_at_date: Timex.today,
    location: Enum.random(["Columbus", "Cleveland"])
  }
  @invalid_attrs %{}

  describe "changeset/2" do
    test "with valid attributes is valid" do
      changeset = Game.changeset(%Game{}, @valid_attrs)
      assert changeset.valid?
    end

    test "is invalid without a player id" do
      attrs = Map.delete(@valid_attrs, :player_id)
      changeset = Game.changeset(%Game{}, attrs)
      refute changeset.valid?
    end

    test "is invalid without an opponent id" do
      attrs = Map.delete(@valid_attrs, :opponent_id)
      changeset = Game.changeset(%Game{}, attrs)
      refute changeset.valid?
    end

    Enum.each @valid_attrs, fn {attr, value} ->
      test "is invalid without #{attr}" do
        attrs = Map.delete(@valid_attrs, unquote(attr))
        changeset = Game.changeset(%Game{}, attrs)
        refute changeset.valid?
      end
    end
  end
end
