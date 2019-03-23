class CreatePickemGuesses < ActiveRecord::Migration[5.2]
  def change
    create_table :pickem_guesses do |t|
      t.references :pickem, foreign_key: true
      t.references :match, foreign_key: true
      t.references :guess, foreign_key: { to_table: :registered_teams }
      t.boolean :correct, default: false
      t.boolean :locked, default: false
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
