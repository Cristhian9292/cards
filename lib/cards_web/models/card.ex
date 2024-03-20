defmodule CardsWeb.Models.Card do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cards.Repo
  alias CardsWeb.Models.Team
  import Ecto.Query, warn: false

  schema "card" do
    field :name, :string
    belongs_to(:team, CardsWeb.Models.Team)
    field :score, :integer

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:name, :team_id, :score])
    |> validate_required([:name, :team_id, :score])
    |> validate_number(:score, greater_than_or_equal_to: 0)
    |> cast_assoc(:team)
    |> unique_constraint([:name, :team_id], message: "card already exists")
  end

  def create(attrs \\ %{}) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def get_all() do
    from(
      c in __MODULE__,
      preload: [
        :team
      ]
    )
    |> Repo.all()
  end

  def get_by_team(team) do
    from(
      c in __MODULE__,
      join: t in Team,
      on: c.team_id == t.id,
      where: t.name == ^team,
      select: c
    )
    |> Repo.all()
  end
end
