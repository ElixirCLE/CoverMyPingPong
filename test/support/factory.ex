defmodule CoverMyPingPong.Factory do
  use ExMachina.Ecto, repo: CoverMyPingPong.Repo

  alias CoverMyPingPong.{Game, User}

  def user_factory do
    %User {
      name: "John Doe"
    }
  end

  def game_factory do
    %Game {
      player_id: build(:user),
      opponent_id: build(:user),
      player_score: Enum.random(0..21),
      opponent_score: Enum.random(0..21),
      match_winner_id: build(:user),
      location: Enum.random(["Columbus", "Cleveland"])
    }
  end
end
