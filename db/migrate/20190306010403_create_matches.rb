class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :home_team, foreign_key: { to_table: :teams }
      t.references :away_team, foreign_key: { to_table: :teams }
      t.integer :home_team_score, default: 0
      t.integer :away_team_score, default: 0
      t.references :winner, foreign_key: { to_table: :teams }
      t.integer :round, default: 0
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end
