defmodule CoverMyPingPong.UserTest do
  use CoverMyPingPong.ModelCase

  alias CoverMyPingPong.User

  @valid_attrs %{matches_played: 42, matches_won: 42, name: "John Doe"}
  @valid_attrs_nil %{matches_played: nil, matches_won: 42, name: "John Doe"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with null attribute is valid" do
    changeset = User.changeset(%User{}, @valid_attrs_nil)
    assert changeset.valid?
  end
end
