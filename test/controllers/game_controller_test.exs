defmodule CoverMyPingPong.GameControllerTest do
  use CoverMyPingPong.ConnCase

  test "GET /matches", %{conn: conn} do
    conn = get conn, "/matches"
    assert html_response(conn, 200) =~ "Recent Matches"
  end

  test "GET /matches/new", %{conn: conn} do
    conn = get conn, "/matches/new"
    assert html_response(conn, 200) =~ "Add Match"
  end
end
