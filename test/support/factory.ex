defmodule Games.Factory do
  use ExMachina.Ecto, repo: CoverMyPingPong.Repo

  def game_factory do
    %CoverMyPingPong.Game{
      player: "John Doe",
      opponent: "Bob Dylan",
      player_score: 11,
      opponent_score: 5,
      match_winner: "John Doe"
    }
  end
end
