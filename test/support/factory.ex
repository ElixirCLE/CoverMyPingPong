defmodule CoverMyPingPong.Factory do
  use ExMachina.Ecto, repo: CoverMyPingPong.Repo
  import CoverMyPingPong.TestHelper, only: [random_score: 1, random_score: 0, random_location: 0]

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
      player_score: random_score,
      opponent_score: random_score,
      match_winner_id: build(:user),
      location: random_location
    }
  end
end
