defmodule Cards.Repo.Migrations.CreateTableTeams do
  use Ecto.Migration

  def up do
    create table(:team) do
      add :name, :string, nil: false

      timestamps()
    end

    create unique_index(:team, [:name])
  end

  def down do
    drop table(:team)
  end
end
