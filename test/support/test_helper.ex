defmodule CoverMyPingPong.TestHelper do
  def random_score(max \\ 21) do
    Enum.random(0..max)
  end

  def random_location do
    locations = ["Columbus", "Cleveland"]
    Enum.random(locations)
  end
end
