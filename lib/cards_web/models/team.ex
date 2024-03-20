defmodule CardsWeb.Models.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cards.Repo
  import Ecto.Query, warn: false

  schema "team" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name, message: "team alaready exists")
  end

  def create(attrs \\ %{}) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def get_all() do
    __MODULE__
    |> Repo.all()
  end

  # def get_id_by_name(name) do
  #   from(
  #     t in __MODULE__,
  #     where: t.name == ^name,
  #     select: t.id
  #   )
  #   |> Repo.one()
  # end
end
