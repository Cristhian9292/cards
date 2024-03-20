defmodule Cards.Repo.Migrations.CreateTableCards do
  use Ecto.Migration

  def up do
    create table(:card) do
      add :name, :string, nil: false
      add :team_id, references(:team), nil: false
      add :score, :integer, nil: false

      timestamps()
    end

    create index(:card, [:name, :team_id], unique: true)
  end

  def down do
    drop table(:card)
  end
end
