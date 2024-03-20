defmodule Cards.CardsTest do
import Cards
alias CardsWeb.Models.Card
alias CardsWeb.Models.Team

use ExUnit.Case

  test "aggregate_team_score returns correct score for a team" do
    cards = [
      %Card{id: 1, name: "Card 1", score: 10, team: %Team{name: "Team A"}},
      %Card{id: 2, name: "Card 2", score: 15, team: %Team{name: "Team A"}},
      %Card{id: 3, name: "Card 3", score: 20, team: %Team{name: "Team B"}},
      %Card{id: 4, name: "Card 4", score: 25, team: %Team{name: "Team B"}}
    ]

    team = "Team A"

    result = Cards.aggreate_team_score(cards, team)

    assert result == 25  # 10 + 15 = 25 (puntajes de las tarjetas del equipo "Team A")
  end
end
