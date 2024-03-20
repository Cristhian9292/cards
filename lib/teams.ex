defmodule Teams do
  alias CardsWeb.Models.Team
  @moduledoc """
  Cards keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def save_team(params) do
    Team.create(params)
  end

  def get_teams() do
    Team.get_all()
  end

  def add_global_score(cards) do
    get_teams() |> Enum.map(fn t -> Map.put(t, :score, Cards.aggreate_team_score(cards, t.name)) end)
  end
end
