defmodule Cards do
  alias CardsWeb.Models.Card
  alias CardsWeb.Models.Team
  @moduledoc """
  Cards keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def save_team(params) do
    try do
      Team.create(params)
    catch
      _ ->
        Team.get_all()
    end
  end

  def get_teams() do
    Team.get_all()
  end

  def save_card(params) do
    try do
      Card.create(params)
    catch
      _ ->
        get_cards()
      end
  end

  def get_cards() do
    Card.get_all()
  end

  def get_cards_by_team(team) do
    Card.get_by_team(team)
  end

  def aggreate_team_score(cards, team) do
    Enum.filter(cards, fn c -> c.team.name == team
    end) |> Enum.map(fn c ->
      c.score
    end) |> Enum.sum()
  end
end
