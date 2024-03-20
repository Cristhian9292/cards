defmodule CardsWeb.PageController do
  use CardsWeb, :controller
  alias Cards
  alias Teams

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end

  def cards(conn, _params) do
    cards = Cards.get_cards()
    teams = Teams.add_global_score(cards)

    render(conn, :cards, cards: cards, teams: teams, layout: false)
  end

  def create(conn, _params) do
    teams = Teams.get_teams()
    render(conn, :create, teams: teams, layout: false)
  end

  def create_team(conn, params) do
    Cards.save_team(params)
    teams = Cards.get_teams()
    render(conn, :create_team, teams: teams, layout: false)
  end

  def new(conn, %{"name" => _name, "team_id" => _team, "score" => _score} = params) do
    Cards.save_card(params)

    cards = Cards.get_cards()
    teams = Teams.add_global_score(cards)

    render(conn, :cards, cards: cards, teams: teams, layout: false)
  end

  def new_team(conn, %{"name" => _name} = params) do
    Cards.save_team(params)

    cards = Cards.get_cards()
    teams = Teams.add_global_score(cards)

    render(conn, :cards, cards: cards, teams: teams, layout: false)
  end
end
