class CreatePredictions < ActiveRecord::Migration[5.2]
  def change
    create_table :predictions do |t|
      t.references :match, foreign_key: true
      t.float :home_team_guess, default: 0.0
      t.float :away_team_guess, default: 0.0
      t.references :winner_guess, foreign_key: { to_table: :teams }
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
