class CreatePickemPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :pickem_players do |t|
      t.references :pickem, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
